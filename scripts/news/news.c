// Script for fetching news from the provided resources
#include <curl/curl.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <tidy/tidy.h>
#include <tidy/tidybuffio.h>
#define NEWS_PANE_SIZE 2
#define MAX_NEWS 6
#define WRAP_SIZE 25

// Source of news
struct source {
  char title[15];
  char url[50];

  // HTML tags to find
  struct elements {
    char parent_element[15];
    char element[5];
    char class[40];
  } elements;
};

// Print counter flag
bool hr_flag = false;

// Select the news pane
bool select_side(int const *argc, char const *value);

// Returns the sources of news
struct source *get_sources(struct source *sources, bool *left);

// Prints news for the sources
void print_news(struct source *sources);

// Prints news for the source
void *print_from_source(void *vargp);

// the curl write callback, to fill tidy's input buffer
uint write_curl_buffer(char *in, uint size, uint nmemb, TidyBuffer *out);

// Makes a GET HTTP request and writes to the buffer
int make_request(char const *url, TidyBuffer *buffer);

// Finds elements in a HTML doc
void dump_node(TidyDoc doc, TidyNode tnod, int *const counter,
               struct source const *source);

void print_wrapped(unsigned char *string, unsigned int max);

// The main function
int main(int argc, char **argv) {
  bool left = select_side(&argc, argv[1]);

  struct source *sources = NULL;
  sources = get_sources(sources, &left);
  print_news(sources);

  free(sources);
  return 0;
}

// Select the new pane
bool select_side(int const *argc, char const *value) {
  return (*argc > 1 && strcmp(value, "left") == 0) ? true : false;
}

// Returns the sources of news
struct source *get_sources(struct source *sources, bool *left) {

  struct source first;
  struct source second;

  if (*left) {
    first = ((struct source){
        "Omg! Ubuntu!",
        "https://www.omgubuntu.co.uk",
        {"body", "a", "layout__title-link"},
    });
    second = ((struct source){
        "Hacker News",
        "https://news.ycombinator.com",
        {"body", "a", "storylink"},
    });
  } else {
    first = ((struct source){
        "Slashdot",
        "https://slashdot.org/popular",
        {"body", "span", "story-title"},
    });
    second = ((struct source){
        "Habr",
        "https://habr.com/ru/top",
        {"body", "a", "post-info__title post-info__title_large"},
    });
  }

  sources = calloc(NEWS_PANE_SIZE, sizeof(first));
  sources[0] = first;
  sources[1] = second;

  return sources;
};

// Prints news for the source
void print_news(struct source *sources) {

  pthread_t id;
  struct source s[NEWS_PANE_SIZE];
  for (int i = 0; i < NEWS_PANE_SIZE; i++) {
    s[i] = (struct source)sources[i];
  }
  for (int i = 0; i < NEWS_PANE_SIZE; i++) {
    pthread_create(&id, NULL, print_from_source, (void *)&s[i]);
  }
  pthread_exit(NULL);
}

// Prints news for the source
void *print_from_source(void *arg) {
  struct source const *source = (struct source *)arg;
  int couter = 0;
  TidyDoc tidy_doc;
  TidyBuffer doc_buffer = {0};
  TidyBuffer tidy_error_buffer = {0};

  tidy_doc = tidyCreate();
  tidyOptSetBool(tidy_doc, TidyForceOutput, yes);
  tidyOptSetInt(tidy_doc, TidyWrapLen, 4096);
  tidySetErrorBuffer(tidy_doc, &tidy_error_buffer);
  tidyBufInit(&doc_buffer);

  int error = make_request(source->url, &doc_buffer);

  if (!error) {
    error = tidyParseBuffer(tidy_doc, &doc_buffer);
    if (hr_flag) {
      printf("\n${hr}\n\n");
    }
    printf("${font Ubuntu Mono:size=16}%s", source->title);
    printf("${font Ubuntu Mono:size=12}\n");
    dump_node(tidy_doc, tidyGetRoot(tidy_doc), &couter, source);
    hr_flag = true;
  }

  /* clean-up */
  tidyBufFree(&doc_buffer);
  tidyBufFree(&tidy_error_buffer);
  tidyRelease(tidy_doc);

  return (void *)true;
}

// the curl write callback, to fill tidy's input buffer
uint write_curl_buffer(char *in, uint size, uint nmemb, TidyBuffer *out) {
  uint r;
  r = size * nmemb;
  tidyBufAppend(out, in, r);
  return r;
}

// Makes a GET HTTP request and writes to the buffer
int make_request(char const *url, TidyBuffer *buffer) {

  CURL *curl;
  char curl_error_buffer[CURL_ERROR_SIZE];
  int error;

  curl = curl_easy_init();
  curl_easy_setopt(curl, CURLOPT_URL, url);
  curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
  curl_easy_setopt(curl, CURLOPT_ERRORBUFFER, curl_error_buffer);
  curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 1);
  curl_easy_setopt(curl, CURLOPT_VERBOSE, 0);
  curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_curl_buffer);

  curl_easy_setopt(curl, CURLOPT_WRITEDATA, buffer);
  error = curl_easy_perform(curl);

  curl_easy_cleanup(curl);
  /* printf("%s", buffer->bp); */
  /* exit(0); */
  return error;
}

// Prints the string wrapped
void print_wrapped(unsigned char *string, unsigned int max) {
  unsigned int counter = 0;
  bool start_tag = false;
  for (unsigned long i = 0; i < strlen((char *)string); i++) {
    if (string[i] == '<') {
      start_tag = true;
      continue;
    }
    if (start_tag && string[i] == '>') {
      start_tag = false;
      continue;
    }
    if (start_tag) {
      continue;
    }
    counter++;
    if (counter > max && string[i] == ' ') {
      printf("\n");
      counter = 0;
    } else {
      printf("%c", string[i]);
    }
  }
}

/* Traverse the document tree */
void dump_node(TidyDoc doc, TidyNode tnod, int *const counter,
               struct source const *source) {

  TidyNode child;

  for (child = tidyGetChild(tnod); child && *counter < MAX_NEWS;
       child = tidyGetNext(child)) {
    ctmbstr name = tidyNodeGetName(child);
    if (name && strcmp(name, source->elements.element) == 0) {
      TidyAttr attr;
      /* walk the attribute list */
      for (attr = tidyAttrFirst(child); attr; attr = tidyAttrNext(attr)) {
        const char *attr_name = tidyAttrName(attr);
        if (strcmp(attr_name, "class") == 0) {
          const char *attr_value = tidyAttrValue(attr);
          if (strcmp(attr_value, source->elements.class) == 0) {

            child = tidyGetChild(child);
            TidyBuffer buf;
            tidyBufInit(&buf);
            tidyNodeGetText(doc, child, &buf);
            printf("\n");
            print_wrapped(buf.bp, WRAP_SIZE);
            tidyBufFree(&buf);
            (*counter)++;
          }
        }
      }
    }
    dump_node(doc, child, counter, source);
  }
}
