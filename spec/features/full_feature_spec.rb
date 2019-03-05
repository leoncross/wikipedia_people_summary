require_relative '../../lib/app_controller'
require_relative '../../lib/app_interface'
require_relative '../../lib/wiki_api'
require_relative '../../spec/helpers'

context 'full feature' do
  it 'found all data relating to john lennon' do
    api = WikiAPI.new
    interface = AppInterface.new
    app = AppController.new(api, interface)
    allow(interface).to receive(:gets).and_return('john lennon')
    expect(interface).to receive(:puts).with(
      'Welcome, please enter the name of the celebrity you would like to search!',
      'At any time, type "exit" to exit out of the app',
      'Accepted search format: "Firstname Lastname" (e.g., John Lennon)',
    )
      expect(interface).to receive(:puts).with(
      "\e[0;31;49mYour searched celebrity details are as follows:\e[0m",
      "\e[0;31;49mBirth date: \e[0m1940|10|9",
      "\e[0;31;49mDeath date: \e[0m1980|12|8",
      "\e[0;31;49mSpouse: \e[0mCynthia Lennon, Yoko Ono",
      "\e[0;31;49mArticle Summary: \e[0mJohn Winston Ono Lennon MBE 9 October 1940–8 December 1980 was an English singer, songwriter, and peace activist who co-founded the Beatles, the most commercially successful band in the history of popular music. He and fellow member Paul McCartney formed a much-celebrated songwriting partnership. Along with George Harrison and Ringo Starr, the group would ascend to worldwide fame during the 1960s. After the group disbanded in 1970, Lennon pursued a solo career and started the band Plastic Ono Band with his second wife Yoko Ono. He was born as John Winston Lennon in Liverpool, where he became involved in the skiffle craze as a teenager. In 1957, he formed his first band, the Quarrymen, which evolved into the Beatles in 1960. Lennon began to record as a solo artist before the bands break-up in April 1970 two of those songs were Give Peace a Chance and Instant Karma! Lennon subsequently produced albums that included John LennonPlastic Ono Band and Imagine, and songs such as Working Class Hero, Imagine and Happy Xmas War Is Over. After he married Yoko Ono in 1969, he added Ono as one of his middle names. Lennon disengaged himself from the music business in 1975 to raise his infant son Sean, but re-emerged with Ono in 1980 with the album Double Fantasy. He was shot and killed in the archway of his Manhattan apartment building three weeks after the album was released. Lennon revealed a rebellious nature and acerbic wit in his music, writing, drawings, on film and in interviews. Controversial through his political and peace activism, he moved from London to Manhattan in 1971, where his criticism of the Vietnam War resulted in a lengthy attempt by the Nixon administration to deport him. Some of his songs were adopted as anthems by the anti-war movement and the larger counterculture. By 2012, Lennons solo album sales in the United States had exceeded 14 million units. He had 25 number-one singles on the US Billboard Hot 100 chart as a writer, co-writer, or performer. In 2002, Lennon was voted eighth in a BBC poll of the 100 Greatest Britons and in 2008, Rolling Stone ranked him the fifth-greatest singer of all time. In 1987, he was posthumously inducted into the Songwriters Hall of Fame. Lennon was twice posthumously inducted into the Rock and Roll Hall of Fame first in 1988 as a member of the Beatles and again in 1994 as a solo artist."
    )
    app.celebrity_search_runner
  end
  
  it 'no user found' do
    api = WikiAPI.new
    interface = AppInterface.new
    app = AppController.new(api, interface)
    allow(interface).to receive(:gets).and_return('adsf asdf')
    expect(interface).to receive(:puts).with(
      'Welcome, please enter the name of the celebrity you would like to search!',
      'At any time, type "exit" to exit out of the app',
      'Accepted search format: "Firstname Lastname" (e.g., John Lennon)',
    )
      expect(interface).to receive(:puts).with(
      "\e[0;31;49mNo data found; please try again\e[0m"
    )
    app.celebrity_search_runner
  end
end
