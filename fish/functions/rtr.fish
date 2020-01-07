function rtr
    echo "$argv" | tr '\n' ' ' | trans --no-ansi -b -d en: :ru | trans -show-translation-phonetics n -show-original-phonetics n -show-languages n -show-alternatives n -show-prompt-message n -d ru: :en
end
