class WordChainer

    def initialize(dictionary_file_name)
        @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
        @steps = Hash.new { |h, k| h[k] = []}
        fill_steps
    end

    # fill_steps maps @dictionary into a Hash where each letter is replaced 
    #  with a * sign one-by-one and collects all the available words possibly 
    # matching the word. Example: *at => cat, hat, bat, fat, mat, sat etc.

    def fill_steps
        @dictionary.each do |word|
            wdup = word.dup
            for i in 0...word.length
                wdup[i] = "0"
                @steps[wdup] << word
                wdup[i] = word[i]
            end
        end
    end

    def adjacent_words(word)
        adjacent_words = []
        wdup = word.dup
        for i in 0...word.length
            wdup[i] = "0"
            if @steps.keys.include?(wdup)
                @steps[wdup].each do |w|
                    adjacent_words << w if w != word
                end
            end
            wdup[i] = word[i]
        end
        adjacent_words
    end

end

