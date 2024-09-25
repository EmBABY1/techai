<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>TechAi</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <link rel="stylesheet" href="assets1\css\fonts.min.css" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">
        <script type="text/javascript">
            function disableRightClick() {
                alert("Sorry, right click is not allowed !!");
                return false;
            }
        </script>


    </head>

    <body class="index-page"oncontextmenu=" return disableRightClick();">

        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">

                <a href="/" class="logo d-flex align-items-center me-auto">
                    <img src="assets\img\logo-no-background.svg"width='100px'>
                    {{-- comment <x-application-logo class="block h-9 w-auto fill-current text-gray-800 dark:text-gray-200" style="width: 100px;height: 100px;color:wheat"  />
 --}} </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        @if (Auth::check())
                            @if (Auth::user()->role_as == 'admin')
                                <li><a href="{{ route('Adashboard') }}">Admin Panel</a></li>
                            @endif
                        @endif

                        <li><a href="{{ route('welcome') }}">Home</a></li>
                        <li><a href="{{ route('welcome') }}#about">About</a></li>
                        <li><a href="{{ route('welcome') }}#services">Services</a></li>
                        <li><a href="{{ route('welcome') }}#news">News</a></li>
                        <li><a href="{{ route('welcome') }}#pricing">Pricing</a></li>
                        <li><a href="{{ route('welcome') }}#contact">Contact</a></li>
                        <li><a href="{{ route('welcome') }}#comments">Comments</a></li>
                        <li><a href="https://developer.opencv.fr/ui/#/onboard/demo" target="_blank">demo</a></li>
                        @if (Auth::user())
                            <li class="dropdown"><a href="#"><span>{{ Auth::user()->name }}</span> <i
                                        class="bi bi-chevron-down toggle-dropdown"></i></a>
                                <ul>
                                    <li><a href="/myplans">My Plans</a></li>
                                    <li><a href="/profile">Profile</a></li>
                                    <li>
                                        <form method="POST" action="{{ route('logout') }}">
                                            @csrf

                                            <x-responsive-nav-link :href="route('logout')"
                                                onclick="event.preventDefault();
                                            this.closest('form').submit();">
                                                {{ __('Log Out') }}
                                            </x-responsive-nav-link>
                                        </form>
                                    </li>
                                </ul>
                    </ul>
                    </li>
                @else
                    <a class="btn-getstarted" href="/register">Register</a>
                    @endif
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>



            </div>
        </header>

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">

                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
                            <h1 class="">Better Solutions For Your Business</h1>
                            <p class="">We are team of talented designers making Smart vision for a smarter future
                            </p>
                            <div class="d-flex">
                                <a href="#about" class="btn-get-started">Get Started</a>
                            </div>
                        </div>
                        <div class="col-lg-6 order-1 order-lg-2 hero-img">
                            <img src="assets/img/download-removebg.png" class="img-fluid animated" alt="">
                        </div>
                    </div>
                </div>

            </section><!-- /Hero Section -->

            <!-- Clients 2 Section -->
            <section id="clients-2" class="clients-2 section">

                <div class="container">

                    <div class="swiper">
                        <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 2,
                  "spaceBetween": 40
                },
                "480": {
                  "slidesPerView": 3,
                  "spaceBetween": 60
                },
                "640": {
                  "slidesPerView": 4,
                  "spaceBetween": 80
                },
                "992": {
                  "slidesPerView": 5,
                  "spaceBetween": 120
                },
                "1200": {
                  "slidesPerView": 6,
                  "spaceBetween": 120
                }
              }
            }
          </script>

                    </div>

                </div>

            </section><!-- /Clients 2 Section -->

            <!-- About Section -->
            <section id="about" class="about section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2 class="">About Us</h2>
                </div><!-- End Section Title -->

                <div class="container">
                    @foreach ($about as $item)
                        <div class="row gy-4">



                            <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
                                <p>
                                    {{ $item->title }}
                                </p>
                                <ul>
                                    <li><i class="bi bi-check2-circle"></i> <span>{{ $item->subject }}</span></li>
                                    <li><i class="bi bi-check2-circle"></i> <span>{{ $item->subject2 }}</span></li>
                                    <li><i class="bi bi-check2-circle"></i> <span>{{ $item->subject3 }}</span></li>
                                </ul>
                            </div>

                            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                                <p>{{ $item->subject4 }} </p>
                            </div>
                        </div>
                    @endforeach

                </div>

            </section><!-- /About Section -->





            <!-- Services Section -->
            <section id="services" class="services section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Services</h2>
                    <p>This Company helps you in many fields like(AI,Machine Learning,Computer Vision)
                    </p>
                </div><!-- End Section Title -->

                <div class="container">

                    <div class="row gy-4">
                        @foreach ($services as $item)
                            <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100"
                                style="color: black;">
                                <div class="service-item position-relative">
                                    <div class="icon">
                                        <img src="{{ asset($item->photo) }}" alt="{{ $item->service }} Icon"
                                            style="max-height: 80px !important; min-height: 80px !important; width=50px!important">
                                    </div>
                                    <p><strong>{{ $item->service }}</strong></p>
                                </div>
                            </div><!-- End Service Item -->
                        @endforeach
                    </div>

            </section><!-- /Services Section -->


            <section id="news">
                <div class="container section-title" data-aos="fade-up">

                    <h2>News</h2>
                    <div class="w3-row-padding w3-padding-32" style="margin:0 -16px;">
                        @foreach ($news as $item)
                            <div class="w3-third w3-margin-bottom">
                                <img src="{{ $item->photo }}" alt="New York" style="width:100%"
                                    class="w3-hover-opacity">
                                <div
                                    class="w3-container w3-white"style="background-color: #031d48!important;color:#007bff!important;text-align:center">
                                    <h3><b>{{ $item->title }}</b></h3>
                                    <h4 style="color: white">{{ $item->body }}.</h4>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                </div>
                </div>


            </section>
            <section id="pricing"
                style="background-image:url('https://1.bp.blogspot.com/-Fo3iRt97ZXY/XvSG4EMwi0I/AAAAAAAAVEo/mrApRTcVVRk1m-fX9K-ffNwRUXlHUocdwCLcBGAsYHQ/s1600/h.jpg');color:white">
                <div class="title-h1 text-center"><span><span class="light">pricing </span> table</span></div>

                <div id="mainCoantiner">
                    <!--dust particel-->
                    <div class="margin-body">

                        <div>
                            <div class="starsec"></div>
                            <div class="starthird"></div>
                            <div class="starfourth"></div>
                        </div>
                        <!--Dust particle end--->


                        <div class="row"
                            style=" display: flex;
    justify-content: center; /* Horizontally center */
    align-items: center;     /* Vertically center */
      ">

                            @foreach ($packages as $index => $item)
                                @if ($index == 0)
                                    <div class="col-sm-3 col-md-3 pricing-column-wrapper">
                                        <div class="pricing-column">
                                            <div class="pricing-price-row">
                                                <div class="pricing-price-wrapper">
                                                    <div class="pricing-price">
                                                        <div class="pricing-cost">${{ $item->price }}</div>
                                                        <div class="time">for {{ $item->duration }}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-row-title">
                                                <div class="pricing_row_title">{{ $item->name }}</div>
                                            </div>

                                            <figure class="pricing-row"><span>{{ $item->property2 }}</span></figure>
                                            <figure class="pricing-row strike">{{ $item->property3 }}</figure>
                                            <figure class="pricing-row strike">{{ $item->property4 }}</figure>
                                            <div class="pricing-footer">

                                                <div class="gem-button-container gem-button-position-center"><a
                                                        href="payments/{{ $item->id }}"
                                                        class="gem-button gem-green">order now</a></div>

                                            </div>
                                        </div>
                                    </div>
                                @elseif ($index == 1)
                                    <div class="col-sm-3 col-md-3 pricing-column-wrapper">
                                        <div class="pricing-column">
                                            <div class="pricing-price-row">
                                                <div class="pricing-price-wrapper">
                                                    <div class="pricing-price">
                                                        <div class="pricing-cost">${{ $item->price }}</div>
                                                        <div class="time">for {{ $item->duration }}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-row-title">
                                                <div class="pricing_row_title">{{ $item->name }}</div>
                                            </div>

                                            <figure class="pricing-row"><span
                                                    style="color: #ffffff;">{{ $item->property2 }}</span></figure>
                                            <figure class="pricing-row"><span
                                                    style="color: #ffffff;">{{ $item->property3 }}</span></figure>
                                            <figure class="pricing-row strike">{{ $item->property4 }}</figure>
                                            <div class="pricing-footer">

                                                <div class="gem-button-container gem-button-position-center"><a
                                                        href="payments/{{ $item->id }}"
                                                        class="gem-button gem-purpel">order now</a></div>

                                            </div>
                                        </div>
                                    </div>
                                @else
                                    <div class="col-sm-3 col-md-3 pricing-column-wrapper">
                                        <div class="pricing-column">
                                            <div class="pricing-price-row">
                                                <div class="pricing-price-wrapper">
                                                    <div class="pricing-price">
                                                        <div class="pricing-cost">${{ $item->price }}</div>
                                                        <div class="time">for {{ $item->duration }}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-row-title">
                                                <div class="pricing_row_title">{{ $item->name }}</div>
                                            </div>

                                            <figure class="pricing-row"><span>{{ $item->property2 }}</span></figure>
                                            <figure class="pricing-row"><span
                                                    style="color: #ffffff;">{{ $item->property3 }}</span></figure>
                                            <figure class="pricing-row">{{ $item->property4 }}</figure>
                                            <div class="pricing-footer">
                                                <div class="gem-button-container gem-button-position-center">

                                                    <div class="gem-button-container gem-button-position-center"><a
                                                            href="payments/{{ $item->id }}"
                                                            class="gem-button gem-orange">order now</a></div>

                                                </div>
                                            </div>
                                        </div>
                                @endif
                            @endforeach
                        </div>

                    </div>
                </div>
            </section><!-- /Pricing Section -->



            <!-- Contact Section -->
            <section id="contact" class="contact section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Contact</h2>
                    <p>If You have a complain or thought please contact us </p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">

                        <div class="col-lg-5">

                            <div class="info-wrap">
                                <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="200">
                                    <i class="bi bi-geo-alt flex-shrink-0"></i>
                                    <div>
                                        <h3>Address</h3>
                                        <p>Al madina</p>
                                    </div>
                                </div><!-- End Info Item -->

                                <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                                    <i class="bi bi-telephone flex-shrink-0"></i>
                                    <div>
                                        <h3>Call Us</h3>
                                        <p>+566 111 111 111</p>
                                    </div>
                                </div><!-- End Info Item -->

                                <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                                    <i class="bi bi-envelope flex-shrink-0"></i>
                                    <div>
                                        <h3>Email Us</h3>
                                        <p>info@example.com</p>
                                    </div>
                                </div><!-- End Info Item -->

                            </div>
                        </div>

                        <div class="col-lg-7">
                            <form method="POST" class="php-email-form">
                                @csrf
                                <div class="row gy-4">
                                    @if (session('msg'))
                                        <div class="alert alert-success">
                                            {{ session('msg') }}
                                        </div>
                                    @endif
                                    <div class="col-md-6">
                                        <label for="name-field" class="pb-2">Your Name</label>
                                        <input type="text" name="name" id="name-field" class="form-control"
                                            required="">
                                    </div>

                                    <div class="col-md-6">
                                        <label for="email-field" class="pb-2">Your Email</label>
                                        <input type="email" class="form-control" name="email" id="email-field"
                                            required="">
                                    </div>

                                    <div class="col-md-12">
                                        <label for="subject-field" class="pb-2">Subject</label>
                                        <input type="text" class="form-control" name="subject" id="subject-field"
                                            required="">
                                    </div>


                                    <div class="col-md-12">
                                        <label for="message-field" class="pb-2">Message</label>
                                        <input type="text"class="form-control" name="message" rows="10"
                                            id="subject-field" required="">
                                    </div>

                                    <div class="col-md-12 text-center">

                                        @if (session('success5'))
                                            <div class="alert alert-success">
                                                {{ session('success5') }}
                                            </div>
                                        @endif

                                        <button type="submit" formaction="contactus">Send Message</button>
                                    </div>

                                </div>
                            </form>
                        </div><!-- End Contact Form -->

                    </div>

                </div>

            </section><!-- /Contact Section -->
            <section id="comments"class="contact section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Comments</h2>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    @if (session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif

                    <form action="{{ url('/comments') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="content">Leave a Comment:</label>
                            <textarea name="content" id="content" class="form-control" rows="4" required
                                style="background-color: #5383b6;color:white"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="text-align: center">Post
                            Comment</button>
                    </form>
                    <br>
                    @foreach ($comments as $comment)
                        <div class="comment">
                            <p>{{ $comment->content }}</p>
                            <small>Posted by {{ $comment->user->name }} on
                                {{ $comment->created_at->format('F j, Y, g:i a') }}</small>
                        </div>
                    @endforeach

                </div>

            </section><!-- /Contact Section -->




        </main>

        <footer id="footer" class="footer">
            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="/" class="d-flex align-items-center">
                            <span class="sitename" style="color: #007bff">TechAi</span>
                        </a>
                        <div class="footer-contact pt-3">
                            <p>1111</p>
                            <p>1111</p>
                            <p class="mt-3"><strong>Phone:</strong> <span>+1 111 111 11</span></p>
                            <p><strong>Email:</strong> <span>info@example.com</span></p>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('welcome') }}">Home</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('welcome') }}#about">About
                                    us</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a
                                    href="{{ route('welcome') }}#services">Services</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bi bi-chevron-right"></i> <a href="#">Advanced AI Systems</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="#">Face Recogintion</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="#">Face Anti-spoofing</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="#">Human Resources</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-12">
                        <h4>Follow Us</h4>
                        <div class="social-links d-flex">
                            <a href=""><i class="bi bi-twitter"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="bi bi-instagram"></i></a>
                            <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>

            <div class="container copyright text-center mt-4">
                <p>© <span>Copyright</span> <strong class="px-1 sitename">TechAi</strong> <span>All Rights
                        Reserved</span></p>
                <div class="credits">

                </div>
            </div>

        </footer>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
<style>


</style>
