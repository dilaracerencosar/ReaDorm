<%@ Page Language="C#" AutoEventWireup="true" CodeFile="proje1.aspx.cs" Inherits="proje1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script> 
    <style>

      #comment{
        text-align: left;
       font-size: 20;
      }
      #book-name{
        margin-top: 10px;
        margin-right: 20px;
        margin-left: 20px;
        font-size: larger;
        font-style: bold;
      }
      #instagram-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        button:hover {
            background-color: #45a049;
        }
        a img {
  max-width: none;
  width: auto;
  height: auto;
}
header {
            text-align: center;
        }

        header a {
            float: right;
            color: white; 
            margin-right: 10px;
            text-decoration: none; 
            transition: color 0.3s; /* Add transition for hover effect */
        }
        header a:hover {
            color: #ffdb8e; /* Change text color on hover */
        }
     .carousel-container {
    width: 182px;
    margin: auto;
    overflow: hidden;
}

.carousel {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.carousel img {
    width: 100%;
    height: auto;
}

.prev, .next {
    cursor: pointer;
    position: absolute;
    top: 20%;
    right: 70%;
    width: auto;
    margin-top: -25px;
    padding: 16px;
    color: black;
    font-weight: bold;
    font-size: 20px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    background-color: #ffeacf;
}

.next {
    right: 0;
    left: 85%;
    border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
    background-color: #ffeacf;
}
    </style>
       <script type="text/javascript">
           function confirmLogout() {
               var confirmLogout = confirm("Are you sure you want to logout?");
               if (confirmLogout) {
                   window.location.href = "proje.aspx?action=logout";
               }
           }
           function confirmLoginandout() {
               var confirmLogout = confirm("Are you sure you want to login again?");
               if (confirmLogout) {
                   window.location.href = "proje.aspx?action=logout";
               }
           }
       </script>
</head>
<body>
              <header>
    ReaDorm
   <a href="#" onclick="confirmLoginandout()">Login</a> 
    
        <a href="#" onclick="confirmLogout()">Logout</a>
   
</header>
        
            <div id="nav-content" tabindex="0">
                <ul>
                    <li><a href="pagehome.aspx">Home</a></li>
                    <li><a href="proje1.aspx">Main Page</a></li>
                    <li><a href="blog.aspx">Blog</a></li>
                    <li><a href="aabout.aspx">About</a></li>
                    <li><a href="ccontact.aspx">Contact</a></li>
                    <li class="small">
                      <a href="#0"onclick="showInstagramPopup()"><i class="fa-brands fa-facebook"></i> Facebook</a>
                      
                  </li>
                  <li>
                    <a href="#0"onclick="showInstagramPopup()"><i class="fab fa-instagram"></i> Instagram</a>
                  </li>
                  <li>
                    <a href="#0" onclick="showInstagramPopup()"><i class="fa-brands fa-twitter"></i>  Twitter</a>
                  </li>
                </ul>
            </div>
  


    <br>

    <div id="main-content">
      <!-- Your main content goes here -->
        <div class="carousel-container">
    <div class="carousel">
        <img src="book1.jpg" alt="Image 1">
        <img src="book2.jpg" alt="Image 2">
        <img src="book3.jpg" alt="Image 3">
        <img src="blindness.jpg" alt="Image 4">
        <img src="stranger.jpg" alt="Image 5">
        <!-- Add more images as needed -->
    </div>

    <div class="prev" onclick="prevSlide()">&#10094;</div>
    <div class="next" onclick="nextSlide()">&#10095;</div>
</div>

<script>
    let currentIndex = 0;
    const totalSlides = document.querySelectorAll('.carousel img').length;

    function showSlide(index) {
        const carousel = document.querySelector('.carousel');
        const slideWidth = document.querySelector('.carousel img').clientWidth;
        const newPosition = -index * slideWidth;

        carousel.style.transform = `translateX(${newPosition}px)`;
        currentIndex = index;
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % totalSlides;
        showSlide(currentIndex);
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
        showSlide(currentIndex);
    }
</script>

      <div id='books-container'>
        <div class="book">
          <a href="book1.aspx?bookId=1">
          <img src="book1.jpg" alt="Book 1"></a>
          <p id="book-name">Brave New World</p>
          <br>
          <p id="comment"> Madeline : I think I liked this one better than 1984, the book traditionally considered to be this one's counterpart. Not really sure why this is, but it's probably because this one has a clearer outsider character (the Savage) who can view the world Huxley created through his separate perspective. </p>
        </div>
  
          <!-- Book 2 -->
        <div class="book">
          <a href="book2.aspx?bookId=2">
          <img src="book2.jpg" alt="Book 2"></a>
          <p id="book-name">The Hunger Games</p>
          <br>
          <p id="comment"> Jana: So I followed as well screaming ReaDorm recommendations and I bought a book that is stupid, violent and written so plainly but of course written for vast masses so they can be touched by fake social awareness. Because it is fake, but most of all it’s tragic.</p>
        </div>
  
           <!-- Book 3 -->
        <div class="book">
          <a href="book3.aspx?bookId=3">
          <img src="book3.jpg" alt="Book 3"></a>
          <p id="book-name">Where The Crawdads Sing</p>
          <br>
          <p id="comment"> Debra: Can I just say that I loved everything about this book and leave it at that!? Where the Crawdads Sing is a story of resiliency, survival, hope, love, loss, loneliness, desperation, prejudice, determination and strength. This book goes back and forth in time to tell the story of Kya Clark a.k.a. the Marsh girl. She lives on the outskirts of town, in the Marsh, and the locals look down their noses at her, she is judged, ridiculed and bullied. But there are those who show her kindness, friendship, and show her love. Oh, how I loved this book!</p>
        </div>
        <div class="book">
          <a href="book4.aspx?bookId=4">
          <img src="blindness.jpg" alt="Book 4"></a>
          <p id="book-name">Blindness</p>
          <br>
          <p id="comment"> Adina: I finished this masterpiece last week and I let it to sink in a little bit before reviewing it. The power of this book was quite overwhelming at times and I had to stop reading for a few days at a time. I do not think there are many books that disturbed me like this one. </p>
        </div>
        <div class="book">
          <a href="book5.aspx?bookId=5">
          <img src="stranger.jpg" alt="Book 5"></a>
          <p id="book-name">The Stranger</p>
          <br>
          <p id="comment"> Luis : The Stranger by Camus - which I picked up randomly from my library - is a classic of the 20th century, and I had never read it. Why? I do not know. Just as I did not know, or even nothing, precisely what this masterpiece of contemporary literature concealed. The discovery was, therefore, complete. And that's what I like when I tackle real work. To know nothing about it, expect nothing, be guided only by its author, and experience only my feelings without previously being driven by outside opinions. </p>
        </div>
        <div class="book">
          <a href="book6.aspx?bookId=6">
          <img src="alchemist.jpg" alt="Book 6"></a>
          <p id="book-name">The Alchemist</p>
          <br>
          <p id="comment"> Sithara : I need to start this review by stating 1) I can't stand self-help books and 2) I'm a feminist (no, I don't hate men- some men are quite awesome, but I am very conscious of women and our place in the world.)
            Short summary (mild spoilers): A boy named Santiago follows his 'Personal Legend' in traveling from Spain to the Pyramids in Egypt searching for treasure. Along the way, he learns 'the Language of the World' the 'Soul of the World' and discovers that the 'Soul of God' is 'his own soul.'
            If the statements in quotes above ('personal legend', etc) fascinate you, then you'll enjoy this book. If you think they are hokey and silly, then you'll think this is a terrible book. If you think statements such as "When you want something, all the universe conspires you to achieve it" and "All things are one" are moving and life-changing, you'll love this book. If such statements have you rolling your eyes, then this isn't your cup of tea. </p>
        </div>
        <div class="book">
          <a href="book7.aspx?bookId=7">
          <img src="heights.jpg" alt="Book 7"></a>
          <p id="book-name">Wuthering Heights</p>
          <br>
          <p id="comment"> Chai : I'm just on fire with so much admiration for Emily Brontë right now. Having read this book, I now understand why it’s generated such fierce controversy since its first publication in 1847. Why early reviews dismissed it as an aberration (with one pearl-clutching reviewer wondering “how a human being could have attempted such a book as the present without committing suicide before he had finished a dozen chapters”) and why writers like Sylvia Plath and E.M. Forster, drawn to the complex and often contradictory open vein of the novel, went out of their way to reject such easy classifications. </p>
        </div>

        <div class="book">
          <a href="book8.aspx?bookId=8">
          <img src="murder.jpg" alt="Book 8"></a>
          <p id="book-name">Murder on the Orient Express</p>
          <br>
          <p id="comment"> Zoe : This was my first Agatha Christie novel and it definitely did not disappoint! I was not expecting that ending, which is obviously a good thing in a murder mystery story, but I am proud of myself for picking up on some other clues. I am so impressed by how she was able to weave this intricate of a story in only 200 pages and I can't wait to pick up another one of her novels in the future!</p>
        </div>

        <div class="book">
          <a href="book9.aspx?bookId=9">
          <img src="notredame.jpg" alt="Book 9"></a>
          <p id="book-name">The Hunchback of Notre-Dame</p>
          <br>
          <p id="comment"> Sophie : Well, this certainly wasn’t what I was expecting!
            I love the Disney movie; the songs, the animation, the characters and the message. If you’re looking for something with the same morals and characters, this is not that story.        
            I didn’t realise just how much the book was about Gothic architecture. And how much the author hated what people had done to those buildings.         
            I have to admit, the whole section where he was describing, in quite a bit of detail, famous buildings or the outline of the entire city, I did speed up the narration.
            I’m sure if I was an architect or history student or even had images in front of me of what was being described, I’d have been a lot more attentive.</p>
        </div>

        <div class="book">
          <a href="book10.aspx?bookId=10">
          <img src="wind.jpg" alt="Book 10"></a>
          <p id="book-name">The Name of the Wind</p>
          <br>
          <p id="comment"> Petrick : As an avid adult fantasy reader, out of all the books that I’ve been recommended, The Name of the Wind has always been recommended to me the most. Google, Goodreads, ReaDorm, book reviewing sites, 9gag, even some people who don't read a lot of fantasy books, they have all praised the series highly and now that I’ve read it, it’s in my opinion that the fame is totally well deserved; there’s no doubt that this is truly a fantastic high fantasy book.</p>
        </div>

        <div class="book">
          <a href="book11.aspx?bookId=11">
          <img src="martineden.jpg" alt="Book 11"></a>
          <p id="book-name">Martin Eden</p>
          <br>
          <p id="comment"> Lena : It is a classical philosophical tragedy: unrecognized genius vs bourgeois society, but the main character is unsympathetical. Although his assumptions about society is hard to deny, his attitude toward other people is pretentious and extremely rude. He values his own principals more than anything else and even in love and charity he proclaims an individualism and Nietzschean ideas of power.
            In general, the book is a nice description of America's society at the beginning of the twentieth century and has deep phycological research of human nature.</p>
        </div>

        <div class="book">
          <a href="book12.aspx">
          <img src="doriangray.jpg" alt="Book 12"></a>
          <p id="book-name">The Picture of Dorian Gray</p>
          <br>
          <p id="comment"> Sean Barrs : I finished reading this last night, and afterwards I spent an entire hour staring into space so I could contemplate over the majesty of this work. It left me speechless. This book is exquisite; it is an investigation into the human soul, the power of vanity and the problems of living a life with not a single consequence for your actions. It’s truly powerful stuff.
            It begins with a simple realisation, and perhaps an obvious one. But, for Dorian it is completely life changing. He realises that beauty is finite. It won’t last forever. It’s like a flower, temporary and splendid. So if you’re a young man whose appearance is your singular quality, then this is some damn scary news. People only want to be with you because you’re attractive and charming; they want to be near you, and with you, for your looks only.         
            So when that goes what do you have left? Nothing.</p>
        </div>

        <div class="book">
          <a href="book13.aspx">
          <img src="mockingbird.jpg" alt="Book 13"></a>
          <p id="book-name">To Kill a Mockingbird</p>
          <br>
          <p id="comment"> Jeynes : When I first read this book three years ago, I really liked it. Sadly, I didn't write my thoughts down in an elaborate way back in the day, but I know for sure, that I didn't read critically then. Upon my re-read of this book, I honestly don't have good things to say. I am aware that some of my criticism is not a critique of the book itself, but about its perception, and how it is, up to this day, held up as the one true book about race relations in the United States of America.
            And that really infiruates me. This book was written by a white woman, from a white perspective, about white characters, for a white audience. This book is a pat on the back for the white middle class. This book gives comfort to the white middle class. Comfort that they, especially back in the 1960s, didn't need, and allow me to be so bold, didn't deserve.</p>
        </div>

        <div class="book">
          <a href="book14.aspx">
          <img src="snow.jpg" alt="Book 14"></a>
          <p id="book-name">Spring Snow</p>
          <br>
          <p id="comment"> Joel : Hands down, my favorite Japanese novel to date!!!
            I can only but sigh finishing reading this masterpiece by Yukio Mishima. I am much overwhelmed by this beautifully poignant book that will surely tugs the heart of any reader.        
            So gorgeously written that demands to be read slow (not because one is intimidated to do so but it is such a beauty to relish every word written, I call it the "Mishima magic") and, indeed, Proustian in its rendition- as universal and constant as the waves of the sea, the introspection of the protagonist have much gone deep, lyrical, profound. Some of the chapters are as allusive, meditative and poetic like a kōan.</p>
        </div>

        <div class="book">
          <a href="book15.aspx">
          <img src="lights.jpg" alt="Book 15"></a>
          <p id="book-name">All the Light We Cannot See</p>
          <br>
          <p id="comment"> Emily : I'm going to be honest - love for this book didn't hit me straight away. In fact, my first attempt to read it last year ended with me putting it aside and going to find something easier, lighter and less descriptive to read. I know - meh, what a quitter.
            But this book is built on beautiful imagery. Both in the literal sense - the physical world of 1940s Paris/Germany - and the metaphorical. It's woven with scientific and philosophical references to light, to seeing and not seeing, and the differences between the two. It's a beautiful work of genius, but it does get a little dense at times; the prose bloated by details.</p>
        </div>
  
      </div>
  </div>
    

  <div id="instagram-popup">

    <p>We are currently working on this :)</p>
    <button onclick="closeInstagramPopup()">Close</button>
</div>
<div id="overlay"></div>
<script>
    function showInstagramPopup() {
      
        document.getElementById('overlay').style.display = 'block';
        document.getElementById('instagram-popup').style.display = 'block';
    }

    function closeInstagramPopup() {
       
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('instagram-popup').style.display = 'none';
    }
</script>
</body>
</html>