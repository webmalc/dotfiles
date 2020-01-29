// Headers
#include <stdbool.h>
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

// Prints the string wrapped
void print_wrapped(unsigned char *string, unsigned int max);
