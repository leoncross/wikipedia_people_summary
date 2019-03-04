require 'wiki_api'
require 'helpers'

johnlennon = JSON.parse(File.read('./json_examples/john_lennon.json'))
hugobergmann = JSON.parse(File.read('./json_examples/hugo_bergmann.json'))
sethrogen = JSON.parse(File.read('./json_examples/seth_rogen.json'))

describe WikiAPI do
  wiki_api = WikiAPI.new

  context 'call_api' do
    it 'stubs API call and returns an empty hash' do
      mock_api_call(johnlennon)
      expect(wiki_api.call_api('John_Lennon')).to eq johnlennon
    end
  end

  context 'day_of_birth' do
    it 'single digit month' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1940|10|9|'
    end
    it 'month and day double digits' do
      mock_api_call(hugobergmann)
      wiki_api.call_api('Hugo_Bergmann')
      expect(wiki_api.day_of_birth).to eq '1883|12|25'
    end
    it 'person still living' do
      mock_api_call(sethrogen)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1982|4|15'
    end
  end

  context 'format_birthday' do
    it 'if birthday is 10 characters, formats appropriately' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      wiki_api.day_of_birth
      expect(wiki_api.format_birthday).to eq '1940|10|9'
    end
  end

  context 'day_of_death' do
    it 'returns the day of the celebries death' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_death).to eq '1980|12|8|'
    end
    it 'returns nil if no death_day' do
      mock_api_call(sethrogen)
      wiki_api.call_api('Seth_Rogen')
      expect(wiki_api.day_of_death).to eq nil
    end
  end

  context 'format_deathday' do
    it 'removes trailing | if it exists' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      wiki_api.day_of_death
      expect(wiki_api.format_deathday).to eq '1980|12|8'
    end
  end

  context 'spouse_list' do
    it 'returns single spouce' do
      mock_api_call(sethrogen)
      wiki_api.call_api('Seth_Rogen')
      expect(wiki_api.spouse_list).to eq ['Lauren Miller']
    end
    it 'returns list of multiple spouces' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.spouse_list).to eq ['Cynthia Lennon', 'Yoko Ono']
    end
  end

  context 'summary' do
    it 'returns a simple summary of the article' do
      mock_api_call(sethrogen)
      wiki_api.call_api('Seth_Rogen')
      expect(wiki_api.summary).to eq "Seth Aaron Rogen ron born April 15, 1982 is a Canadian-American actor, voice actor, stand-up comedian, writer, producer, and director. He began his career performing stand-up comedy during his teenage years. While still living in his native Vancouver, he landed a supporting role in Judd Apatows series Freaks and Geeks. Shortly after he moved to Los Angeles for his role, Freaks and Geeks was officially cancelled after one season due to low viewership. Rogen later got a part on sitcom Undeclared, which also hired him as a writer. After landing his job as a staff writer on the final season of Da Ali G Show, Apatow guided him toward a film career. Rogen made his first movie appearance in Donnie Darko with a minor role in 2001. Rogen was cast in a supporting role and credited as a co-producer in Apatows directorial debut, The 40-Year-Old Virgin. Universal Pictures subsequently cast him as the lead in Apatows films Knocked Up and Funny People. Rogen co-starred as Steve Wozniak in Universals Steve Jobs biopic in 2015. In 2016, he developed the AMC television series Preacher with his writing partner Evan Goldberg and Sam Catlin. He also serves as a writer, executive producer, and director, with Goldberg. Rogen and Goldberg co-wrote the films Superbad, Pineapple Express, The Green Hornet, This Is the End, and directed both This Is the End and The Interview all of which Rogen starred in. He has also done voice work for the films Horton Hears a Who!, the Kung Fu Panda film series, The Spiderwick Chronicles, Monsters vs. Aliens, Paul, Sausage Party, and will provide the voice of Pumbaa in the 2019 remake of The Lion King."

    end
    it 'returns list of multiple spouces' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.summary).to eq "John Winston Ono Lennon MBE 9 October 1940–8 December 1980 was an English singer, songwriter, and peace activist who co-founded the Beatles, the most commercially successful band in the history of popular music. He and fellow member Paul McCartney formed a much-celebrated songwriting partnership. Along with George Harrison and Ringo Starr, the group would ascend to worldwide fame during the 1960s. After the group disbanded in 1970, Lennon pursued a solo career and started the band Plastic Ono Band with his second wife Yoko Ono. He was born as John Winston Lennon in Liverpool, where he became involved in the skiffle craze as a teenager. In 1957, he formed his first band, the Quarrymen, which evolved into the Beatles in 1960. Lennon began to record as a solo artist before the bands break-up in April 1970 two of those songs were Give Peace a Chance and Instant Karma! Lennon subsequently produced albums that included John LennonPlastic Ono Band and Imagine, and songs such as Working Class Hero, Imagine and Happy Xmas War Is Over. After he married Yoko Ono in 1969, he added Ono as one of his middle names. Lennon disengaged himself from the music business in 1975 to raise his infant son Sean, but re-emerged with Ono in 1980 with the album Double Fantasy. He was shot and killed in the archway of his Manhattan apartment building three weeks after the album was released. Lennon revealed a rebellious nature and acerbic wit in his music, writing, drawings, on film and in interviews. Controversial through his political and peace activism, he moved from London to Manhattan in 1971, where his criticism of the Vietnam War resulted in a lengthy attempt by the Nixon administration to deport him. Some of his songs were adopted as anthems by the anti-war movement and the larger counterculture. By 2012, Lennons solo album sales in the United States had exceeded 14 million units. He had 25 number-one singles on the US Billboard Hot 100 chart as a writer, co-writer, or performer. In 2002, Lennon was voted eighth in a BBC poll of the 100 Greatest Britons and in 2008, Rolling Stone ranked him the fifth-greatest singer of all time. In 1987, he was posthumously inducted into the Songwriters Hall of Fame. Lennon was twice posthumously inducted into the Rock and Roll Hall of Fame first in 1988 as a member of the Beatles and again in 1994 as a solo artist."
    end
  end
end
