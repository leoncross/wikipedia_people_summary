![image](https://user-images.githubusercontent.com/43062443/53802567-01a8bf00-3f3a-11e9-9cda-89a98bef4be8.png)

# Famous People Summariser for Wikipedia:

1. [Task](#task)
2. [My Approach](#my_approach)
3. [Technologies used](#technologies)
4. [Installation](#installation)
5. [How to run the tests](#how_to_run_tests)
6. [How to run the app](#how_to_run_the_app)
7. [Example of app](#example_of_app)

# <a name="task">Task</a>:
The given task was as follows:
```
As a pop culture enthusiast,
I would like to get brief summaries of famous people
so that I can learn about significant details of their lives.
```

ACCEPTANCE CRITERIA

The app is a command line application
The app uses the MediaWikipedia API (https://en.wikipedia.org/w/api.php) to retrieve information
The app takes the name of a famous person as input
The app outputs the values from the following fields:
- Born
- Died (if this field exists)
- Spouses (if this field exists)
- The main summary of the article

# <a name="my_approach">My Approach</a>:

When I received the challenge, I quickly identified 2 key criteria:
  1. the app should be run through the command line
  2. communicate with an API
For both of these reasons, I decided to build the app in Ruby; this has the following benefits:
  1. Ruby is synchronous language, which means it runs from top-to-bottom. This allows for fast development of API apps, as there is no need for callback functions (such as in JavaScript)

From here, I quickly went into reading as much as possible on the MediaWikipedia API documentation; having just finished an app in JS using APIs; I focused on identifying the route to information - what call do I need to make in order to get the exact information I want in return.

After significant researching, I started to understand that the challenge focused heavily on string manipulation - there was not some simple call to the API JSON to get the exact .birth_date for example. At this moment, I was further relieved I choose to complete this in Ruby, as ruby is brilliant at manipulating strings.

From here, I spent my time focusing on the unique composition of the JSON data - what are the common similarities. For example, I found that '{{Infobox' refers to the information box on the side, this gives information related to birth, death and spouses. From here, I knew my approach to this challenge.

I subsequently set up my environment - this included RSpec for tests, Rubocop for linting, SimpleCov for test coverage data, Webmock to mock API calls, and then HTTParty to communicate with the API.

From here, I followed a strict Test Driven Development, Object Oriented Design approach, with each commit signifying a Red-Green-Refactor process.

This approach started on focusing on the API - focusing on getting back exactly what I expect (i.e., date of birth, death etc.). Once I had completed the wiki_api class, I moved onto the controller - this was to sit in the middle between the interface class and api class. Once completed this, I then moved onto the interface.

The design philosophy focuses on each class having a single responsibility; because of this, I laid out my classes similar to an MVC model;
```
- app_controller // controls the app, and passes data between wiki api and interface
- app_interface // handles the interface requirements
- wiki_api // communicates and manages the data from the API

```
On the note of my tests - I felt the best approach to mock the API call, would be to save the result in a JSON, a few are saved in ./json_examples. These are then called in my tests (from ./spec/helpers.rb) for my tests to ensure I am getting back exactly what I want to be returning.

### Moving forward:

If there was more time to this project, I would not have focused on string manipulation in such a hard-coded way. It doesn't feel smart, nor sustainable to develop such a programme in this format. For example; currently wikipedia treats all spouses as a 'marriage' - if they were to eventually split this up to include civil partnerships, this would break the code. (Side note - through this app, I learnt that there is a high level of styling/naming inconsistency on wikipedia!)

Because of this, I would instead focus on developing a more complex parser that can account for much more variation in code, and then have the entire JSON be converted into a more traditional hash, so it could be callable in a more legible/cleaner way (i.e., {wiki_api_response}.date_of_birth // 01/01/1900)

This would be one option; especially if the strict criteria remained to calling MediaWikipedia API; however, in my searches I came across DBpedia - https://wiki.dbpedia.org/. This would be called instead of the MediaWikipedia API, and does exactly as I outlined above - returns data in a more usable format.

# <a name="technologies">Technologies used</a>:
To achieve this challenge, I used the following technologies:
```
Ruby
RSpec
SimpleCov
Rubocop
Webmock
HTTParty
```
# <a name="installation">Installation</a>:

In the command line, type the following:

```
git clone https://github.com/leoncross/wikipedia_people_summary.git
cd wikipedia_people_summary
bundle install
```

# <a name="how_to_run_tests">How to run the tests</a>:
In the command line, type the following:

```
rspec // this will show coverage reports, as well as run all the tests

rubocop // this will run the linter
```

# <a name="how_to_run_the_app">How to run the app</a>:
After cloning this repo, navigate to the root of the app and type:
```
ruby app.rb
```
This will produce some text telling explaining the format to enter your search.

# <a name="example_of_app">Example of app</a>:
```
$ ruby app.rb

> Welcome, please enter the name of the celebrity you would like to search!
> Accepted search format: "Firstname Lastname" (e.g., John Lennon)

$ John Lennon

> Your searched celebrity details are as follows:
> Birth date: 1940|10|9
> Death date: 1980|12|8
> Spouse(s): Cynthia Lennon, Yoko Ono
> Article Summary: John Winston Ono Lennon MBE 9 October 1940–8 December 1980 was an English singer, songwriter, and peace activist who co-founded the Beatles, the most commercially successful band in the history of popular music. He and fellow member Paul McCartney formed a much-celebrated songwriting partnership. Along with George Harrison and Ringo Starr, the group would ascend to worldwide fame during the 1960s. After the group disbanded in 1970, Lennon pursued a solo career and started the band Plastic Ono Band with his second wife Yoko Ono. He was born as John Winston Lennon in Liverpool, where he became involved in the skiffle craze as a teenager. In 1957, he formed his first band, the Quarrymen, which evolved into the Beatles in 1960. Lennon began to record as a solo artist before the bands break-up in April 1970 two of those songs were Give Peace a Chance and Instant Karma! Lennon subsequently produced albums that included John LennonPlastic Ono Band and Imagine, and songs such as Working Class Hero, Imagine and Happy Xmas War Is Over. After he married Yoko Ono in 1969, he added Ono as one of his middle names. Lennon disengaged himself from the music business in 1975 to raise his infant son Sean, but re-emerged with Ono in 1980 with the album Double Fantasy. He was shot and killed in the archway of his Manhattan apartment building three weeks after the album was released. Lennon revealed a rebellious nature and acerbic wit in his music, writing, drawings, on film and in interviews. Controversial through his political and peace activism, he moved from London to Manhattan in 1971, where his criticism of the Vietnam War resulted in a lengthy attempt by the Nixon administration to deport him. Some of his songs were adopted as anthems by the anti-war movement and the larger counterculture. By 2012, Lennons solo album sales in the United States had exceeded 14 million units. He had 25 number-one singles on the US Billboard Hot 100 chart as a writer, co-writer, or performer. In 2002, Lennon was voted eighth in a BBC poll of the 100 Greatest Britons and in 2008, Rolling Stone ranked him the fifth-greatest singer of all time. In 1987, he was posthumously inducted into the Songwriters Hall of Fame. Lennon was twice posthumously inducted into the Rock and Roll Hall of Fame first in 1988 as a member of the Beatles and again in 1994 as a solo artist.

```
