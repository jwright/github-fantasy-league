github fantasy league (Ruby)
===========================================
***

## DESCRIPTION

Compare Github users. It queries Github using the activity stream for a given username (`https://api.github.com/users/{username}/events`). This is the same problem presented to [Aaron Patterson](https://peepcode.com/products/play-by-play-tenderlove-ruby-on-rails) and [Yehuda
Katz](https://peepcode.com/products/play-by-play-wycats-i-ruby-on-rails) for the Play by Play by [PeepCode](http://peepcode.com).

This code is deployed at [http://githubfantasy.com](http://githubfantasy.com).

A .NET version of this same application is available at [github-fantasy-league-dotnet](https://github.com/jwright/github-fantasy-league-dotnet).

**UPDATE (1/26/2015)**: GitHub updated their API. The Walkthrough refers to the API being at `https://githib.com{username}.json`. This is the old API per this blog post: (http://git.io/17AROg)[http://git.io/17AROg].

### Scoring system

The score is calculated based on the following activity stream's events.

* CommitCommentEvent - 2pts
* IssueCommentEvent - 2pts
* IssuesEvent - 3pts
* WatchEvent - 1pt
* PullRequestEvent - 5pts
* PushEvent - 7pts
* FollowEvent - 1pt
* CreateEvent - 3pts

## WALKTHROUGH

* [Part 1 - Create Project in .NET](https://vimeo.com/57713524)
* [Part 1 - Create Project in Rails](https://vimeo.com/64746542)
* [Part 2 - Create Feature in .NET](https://vimeo.com/64747043)
* [Part 2 - Create Feature in Rails](https://vimeo.com/64771140)
* [Part 3 - Implement First 3 Steps in .NET](https://vimeo.com/64772605)
* [Part 3 - Implement First 3 Steps in Rails](https://vimeo.com/64772606)
* [Part 4 - Spec User in .NET](https://vimeo.com/66321277)
* [Part 4 - Spec User in Rails](https://vimeo.com/68027217)
* [Part 5 - Spec GitHubScorer in .NET](https://vimeo.com/68027216)
* [Part 5 - Spec GitHubScorer in Rails](https://vimeo.com/68592199)
* [Part 6 - Spec GitHub Event in .NET](https://vimeo.com/68592200)
* [Part 6 - Spec GitHub Event in Rails](https://vimeo.com/69960166)
* [Part 7 - Implement Users Controller in .NET](https://vimeo.com/69960165)
* [Part 7 - Add VCR in Rails](https://vimeo.com/70226264)
* [Part 8 - Implement Users Controller in Rails](https://vimeo.com/70308404)
