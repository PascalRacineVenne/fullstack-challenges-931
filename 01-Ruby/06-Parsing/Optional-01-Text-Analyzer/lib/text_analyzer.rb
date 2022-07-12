def analyze(text)
  output = text_hash(text)
  output[:average_words_per_sentence] = (output[:word_count].to_f / output[:sentence_count]).round(2)
  output[:average_sentences_per_paragraph] = (output[:sentence_count].to_f / output[:paragraph_count]).round(2)
  return output  
end

def text_hash(text)
  {
    character_count: text.size,
    character_count_excluding_spaces: text.gsub(/\s/, '').size,
    line_count: text.scan(/^.*$/).size,
    word_count: text.scan(/\w+/).size,
    sentence_count: text.split(".").size,
    paragraph_count: text.split("/n/n").size,
  }
end