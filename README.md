# Calculus 2 Video Player -  Contemporary Calculus

<center><img src="http://www.opentextbookstore.com/covers/hoffmancalc1.jpg" width="196" height="196" alt="Contemporary Calculus"><img src="https://yt3.ggpht.com/-ss1R1LMzxKk/AAAAAAAAAAI/AAAAAAAAAAA/jsQ17GsKAKo/s100-c-k-no/photo.jpg" width="196" height="196" alt="Mathispower4u"></center>

Textbook: [Contemporary Calculus by Dale Hoffman](http://scidiv.bellevuecollege.edu/dh/Calculus_all/Calculus_all.html)

Videos created by [James Sousa](http://www.mathispower4u.com/)

Video Player created by [James Jalandoni](https://www.linkedin.com/in/jamesjalandoni)

## Re-scraping Videos from Site

The videos are scraped from the site: [http://scidiv.bellevuecollege.edu/dh/CC_Videos*/ContempCalcVideoLibrary.html](http://scidiv.bellevuecollege.edu/dh/CC_Videos*/ContempCalcVideoLibrary.html)

scrape_calc_videos.rb uses [nokogiri](https://github.com/sparklemotion/nokogiri) to grab all the video links, sort them by section and chapter, and output a file "video_hash.json".

To run the script:

```
    bundle install
    ruby scrape_calc_videos.rb
```

The hash uses a template below:

```
    {
      CHAPTER_N: {
          SECTION_TITLE: [{
            title: video_1_title,
            id: video_1_youtube_id
          },
          {
            title: video_2_title,
            id: video_2_youtube_id
          }]
       }
    }
```

