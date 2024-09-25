<!DOCTYPE html>
<html lang="en">
    <style>
        input,
        textarea,
        select {

            background-color: #4c90af;
        }
    </style>

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Admin Pannel</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">


    </head>

    <body class="index-page">

        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">

                <a href="/" class="logo d-flex align-items-center me-auto">
                    <img src="assets\img\logo-no-background.svg"width='100px'>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="{{ route('Adashboard') }}">Dashboard</a></li>
                        <li><a href="{{ route('adminpannel') }}">Home</a></li>
                        <li><a href="{{ route('adminpannel') }}#users">Users</a></li>
                        <li><a href="{{ route('adminpannel') }}#financialmanagement">financial management</a></li>
                        <li><a href="{{ route('adminpannel') }}#packages">packages</a></li>
                        <li><a href="{{ route('adminpannel') }}#news">News</a></li>
                        <li class="dropdown"><a href="#"><span>Pages</span> <i
                                    class="bi bi-chevron-down toggle-dropdown"></i></a>
                            <ul>
                                <li><a href="{{ route('adminpannel') }}#subscription">Subscriptions</a></li>
                                <li><a href="{{ route('adminpannel') }}#comments">Comments</a></li>
                                <li><a href="{{ route('adminpannel') }}#complains">Complains</a></li>
                                <li><a href="{{ route('adminpannel') }}#about">About</a></li>
                                <li><a href="{{ route('adminpannel') }}#services">Services</a></li>
                            </ul>
                        </li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                {{-- this pages for logout --}}
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
                <li>
                    <a href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                            document.getElementById('logout-form').submit();"class="btn-getstarted">
                        {{ __('Logout') }}
                    </a>
                </li>
            </div>
        </header>

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">

                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
                            <h1 class="">Admin Pannel Page</h1>
                            <p class="">This Page Control All User Interface</p>
                            <div class="d-flex">
                                <a href="{{ route('adminpannel') }}" class="btn-get-started">Get Started</a>
                            </div>
                        </div>
                        <div class="col-lg-6 order-1 order-lg-2 hero-img">
                            <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
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

            <!-- User Section -->
            <section id="users" class="services section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2 class="">users</h2>
                </div><!-- End Section Title -->
                @if (session('fail'))
                    <div class="alert alert-success">
                        {{ session('fail') }}
                @endif
                </div>
                <div class="container">

                    <button id="showuser" onclick="toggleTable()">Show</button>

                    <table id="userTable" border="0" style="display: none; color: black ;background-color: no">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                                <th>Role</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form method="POST">
                                @csrf
                                @method('DELETE')
                                @foreach ($users as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->name }}</td>
                                        <td>{{ $item->email }}</td>
                                        <td>{{ $item->created_at }}</td>
                                        <td>{{ $item->updated_at }}</td>
                                        <td>{{ $item->role_as }}</td>
                                        <td>
                                            <button type="submit" formaction="destroyuser/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </form>
                        </tbody>
                    </table>

                    <script>
                        function toggleTable() {
                            var table = document.getElementById("userTable");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="insertuser" onclick="toggleInsertTable()"> Insert </button>

                    <table id="insertTable" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <form method="POST">
                                    @csrf
                                    <td><input type="text" name="name" required></td>
                                    <td><input type="email" name="email" required></td>
                                    <td><input type="password" name="password" required></td>
                                    <td><input type="text" name="role_as" required></td>
                                    <td><button type="submit"formaction="storeuser">Insert</button></td>
                                </form>
                            </tr>
                        </tbody>
                    </table>

                    <script>
                        function toggleInsertTable() {
                            var table = document.getElementById("insertTable");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="updateuser" onclick="toggleUpdateTable()"> Update </button>

                    <table id="updateTable" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>password</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                                <tr>
                                    <form method="POST" action="updateuser/{{ $user->id }}">
                                        @csrf
                                        <td>{{ $user->id }}</td>
                                        <td><input type="text" name="name" value="{{ $user->name }}"
                                                required></td>
                                        <td><input type="email" name="email" value="{{ $user->email }}"
                                                required></td>
                                        <td><input type="password" name="password"
                                                placeholder="Leave blank to keep current password"></td>
                                        <td><input type="text" name="role_as" value="{{ $user->role_as }}"
                                                required></td>
                                        <td><button type="submit">Update</button></td>
                                    </form>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <script>
                        function toggleUpdateTable() {
                            var table = document.getElementById("updateTable");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>



            </section><!-- /About Section -->





            <!-- financialmanagement Section -->
            <section id="financialmanagement" class="services section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>financial management</h2>

                </div><!-- End Section Title -->
                @if (session('success6'))
                    <div class="alert alert-success">
                        {{ session('success6') }}
                    </div>
                @endif
                <div class="container">
                    <button id="showfinancials" onclick="showfinancials()">Show</button>

                    <table id="showfinancial" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>No of Subscriptions</th>
                                <th>Package Name</th>
                                <th>Package Price</th>
                                <th>Total Price of Each Package</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                global $total;
                                $total = 0;
                                global $val;
                                $val = '';
                            @endphp
                            @foreach ($financial as $item)
                                <tr>
                                    <td>{{ $item->no_of_subscriptions }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->price }}$</td>
                                    <td>{{ $item->total_price_of_each_package }}$</td>
                                    @php
                                        global $val;
                                        $val = $item->total_price_of_all_packages;
                                    @endphp
                                </tr>
                            @endforeach
                            <tr>
                                <th colspan="3" style="text-align: center">Total Price of All Packages</th>
                                <td>{{ $val }}$</td>
                            </tr>
                        </tbody>
                    </table>
                    <script>
                        function showfinancials() {
                            var table = document.getElementById("showfinancial");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>

            </section>

            <!-- packages Section -->
            <section id="packages" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Packages</h2>
                </div><!-- End Section Title -->
                @if (session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @endif
                <div class="container">
                    <button id="showpackage" onclick="showpackages()">Show</button>

                    <table id="packagesTable" border="1" style="display: none;">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Property 2</th>
                                <th>Property 3</th>
                                <th>Property 4</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($packages as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->duration }}</td>
                                    <td>{{ $item->price }}</td>
                                    <td>{{ $item->description }}</td>
                                    <td>{{ $item->property2 }}</td>
                                    <td>{{ $item->property3 }}</td>
                                    <td>{{ $item->property4 }}</td>
                                    <td>
                                        <form method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit"formaction="destroypackage/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>


                    </table>

                    <script>
                        function showpackages() {
                            var table = document.getElementById("packagesTable");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="updatepackage" onclick="updatepackage()"> Update </button>

                    <table id="updatepackages" border="1" style="display: none;">
                        <thead>
                            @foreach ($packages as $item)
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Duration</th>
                                    <th>Price</th>
                                    <th>Description</th>

                                <tr>
                                    <form method="POST" action="updatepackage/{{ $item->id }}">
                                        @csrf
                                        <td>{{ $item->id }}</td>
                                        <td><input type="text" name="name" value="{{ $item->name }}"
                                                required></td>
                                        <td><input type="text" name="duration" value="{{ $item->duration }}"
                                                required></td>
                                        <td><input type="number" name="price" value="{{ $item->price }}"
                                                required></td>
                                        <td><input type="text" name="description"
                                                value="{{ $item->description }}" required></td>
                                </tr>
                                <th>Property 2</th>
                                <th>Property 3</th>
                                <th>Property 4</th>
                                <th>Action</th>
                                </tr>
                                <tr>


                                    <td><input type="text" name="property2" value="{{ $item->property2 }}"
                                            required></td>
                                    <td><input type="text" name="property3" value="{{ $item->property3 }}"
                                            required></td>
                                    <td><input type="text" name="property4" value="{{ $item->property4 }}"
                                            required></td>
                                    <td><button type="submit">Update</button></td>
                                    </form>


                                </tr>
                            @endforeach
                        </thead>
                    </table>

                    <script>
                        function updatepackage() {
                            var table = document.getElementById("updatepackages");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="insertpackage" onclick="insertpackage()"> Insert </button>

                    <table id="insertpackages" border="1" style="display: none;">

                        <form method="POST" action="insertpackage">
                            @csrf
                            <tr>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th rowspan="3">Action</th>
                            <tr>
                                <td><input type="text" name="name" required></td>
                                <td><input type="text" name="duration" required></td>
                                <td><input type="number" name="price" required></td>
                                <td><input type="text" name="description" required></td>
                            </tr>

                            <th>Property 2</th>
                            <th>Property 3</th>
                            <th>Property 4</th>


                            </tr>

                            <tr>
                                <td><input type="text" name="property2" required></td>
                                <td><input type="text" name="property3" required></td>
                                <td><input type="text" name="property4" required></td>
                                <td rowspan="2"><button type="submit">insert</button></td>
                        </form>
                        </tr>

                    </table>

                    <script>
                        function insertpackage() {
                            var table = document.getElementById("insertpackages");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>


            </section><!-- /Packages Section -->
            <section id="news" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>News</h2>
                </div><!-- End Section Title -->
                @if (session('success1'))
                    <div class="alert alert-success">
                        {{ session('success1') }}
                    </div>
                @endif
                <div class="container">
                    <button id="shownew" onclick="shownews()">Show</button>

                    <table id="shownews" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>title</th>
                                <th>body</th>
                                <th>photo</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form method="POST">
                                @csrf
                                @method('DELETE')
                                @foreach ($news as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->title }}</td>
                                        <td>{{ $item->body }}</td>
                                        <td>{{ $item->photo }}</td>
                                        <td>
                                            <button type="submit" formaction="destroynews/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </form>
                        </tbody>
                    </table>

                    <script>
                        function shownews() {
                            var table = document.getElementById("shownews");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="updatenew" onclick="updatenews()"> Update </button>

                    <table id="updatenews" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Body</th>
                                <th>Photo</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($news as $item)
                                <tr>
                                    <form method="POST"
                                        action="updatenews/{{ $item->id }}"enctype="multipart/form-data">
                                        @csrf
                                        <td>{{ $item->id }}</td>
                                        <td><input type="text" name="title" value="{{ $item->title }}"
                                                required></td>
                                        <td><input type="textarea" name="body" required></td>
                                        <td><input type="file" name="photo" required></td>
                                        <td><button type="submit">Update</button></td>
                                    </form>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <script>
                        function updatenews() {
                            var table = document.getElementById("updatenews");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="insertnew" onclick="insertnews()"> Insert </button>

                    <table id="insertnews" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Body</th>
                                <th>Photo</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <form method="POST" action="insertnews"enctype="multipart/form-data">
                                    @csrf
                                    <td><input type="text" name="title" required></td>
                                    <td><input type="textarea" name="body" required></td>
                                    <td><input type="file" name="photo" required></td>
                                    <td><button type="submit">insert</button></td>
                                </form>
                            </tr>
                        </tbody>
                    </table>

                    <script>
                        function insertnews() {
                            var table = document.getElementById("insertnews");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>


            </section><!-- /News Section -->
            <section id="subscription" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Subscription</h2>
                </div><!-- End Section Title -->
                @if (session('success4'))
                    <div class="alert alert-success">
                        {{ session('success4') }}
                    </div>
                @endif
                <div class="container">
                    <button id="Showsubscript" onclick="showsubscriptor()">Show</button>

                    <table id="subscriptorTable" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Package Name</th>
                                <th>User Name</th>
                                <th>User Email</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($subscriptor as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->from_date }}</td>
                                    <td>{{ $item->to_date }}</td>
                                    <td>{{ $item->package_name }}</td>
                                    <td>{{ $item->user_name }}</td>
                                    <td>{{ $item->user_email }}</td>
                                    <td>
                                        <form method="POST" action="destroysubscriptor/{{ $item->id }}">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <button id="updatesubscript" onclick="updatesubscriptor()">Update</button>

                    <table id="updatesubscriptor" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Package ID</th>
                                <th>User ID</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($subscriptor as $item)
                                <tr>
                                    <form method="POST" action="updatesubscriptor/{{ $item->id }}">
                                        @csrf
                                        <td>{{ $item->id }}</td>
                                        <td><input type="datetime-local" name="from_date"
                                                value="{{ $item->from_date }}" required></td>
                                        <td><input type="datetime-local" name="to_date" value="{{ $item->to_date }}"
                                                required></td>
                                        <td><input type="number" name="package_id" value="{{ $item->package_id }}"
                                                required></td>
                                        <td><input type="number" name="user_id" value="{{ $item->user_id }}"
                                                required></td>
                                        <td><button type="submit">Update</button></td>
                                    </form>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <script>
                        function showsubscriptor() {
                            var table = document.getElementById("subscriptorTable");
                            table.style.display = table.style.display === "none" ? "table" : "none";
                        }

                        function updatesubscriptor() {
                            var table = document.getElementById("updatesubscriptor");
                            table.style.display = table.style.display === "none" ? "table" : "none";
                        }
                    </script>

                    <button id="insertsubscript" onclick="toggleInsertForm()">Insert</button>

                    <table id="insertsubscriptor" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>From</th>
                                <th>To</th>
                                <th>Package Name</th>
                                <th>User Email</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <form method="POST" action="insertsubscriptor">
                                    @csrf
                                    <td><input type="datetime-local" name="from_date" required></td>
                                    <td><input type="datetime-local" name="to_date" required></td>
                                    <td>
                                        <select name="package_id" id="package_id" required>
                                            @foreach ($packages as $item)
                                                <option value="{{ $item->id }}"
                                                    data-package-name="{{ $item->name }}"
                                                    data-package-price="{{ $item->price }}">{{ $item->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <input type="hidden" name="package_name" id="package_name" required>
                                        <input type="hidden" name="package_price" id="package_price" required>
                                    </td>
                                    <td>
                                        <select name="user_id" required>
                                            @foreach ($users as $item)
                                                <option value="{{ $item->id }}">{{ $item->email }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td><button type="submit">Insert</button></td>
                                </form>
                            </tr>
                        </tbody>
                    </table>

                    <script>
                        function toggleInsertForm() {
                            var table = document.getElementById("insertsubscriptor");
                            table.style.display = table.style.display === "none" ? "table" : "none";
                        }

                        // Update hidden fields based on selected package
                        document.querySelector('select[name="package_id"]').addEventListener('change', function() {
                            var selectedOption = this.options[this.selectedIndex];
                            document.getElementById('package_name').value = selectedOption.getAttribute('data-package-name');
                            document.getElementById('package_price').value = selectedOption.getAttribute('data-package-price');
                        });

                        // Trigger the change event to set initial values
                        document.querySelector('select[name="package_id"]').dispatchEvent(new Event('change'));
                    </script>



            </section>
            <!-- /Complains Section -->
            <section id="complains" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Complains</h2>
                </div><!-- End Section Title -->
                @if (session('success11'))
                    <div class="alert alert-success">
                        {{ session('success11') }}
                    </div>
                @endif
                <div class="container">
                    <button id="showcomplains" onclick="showcomplains()">Show</button>

                    <table id="showcomplain" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Subject</th>
                                <th>Message</th>
                                <th>User Name</th>
                                <th>Created at</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form method="POST">
                                @csrf
                                @method('DELETE')
                                @foreach ($complains as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->subject }}</td>
                                        <td>{{ $item->message }}</td>
                                        <td>{{ $item->email }}</td>
                                        <td>{{ $item->created_at->format('F j, Y, g:i a') }}</td>
                                        <td>
                                            <button type="submit" formaction="destroycomplain/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </form>
                        </tbody>
                    </table>

                    <script>
                        function showcomplains() {
                            var table = document.getElementById("showcomplain");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>
            </section>
            <section id="comments" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Comments</h2>
                </div><!-- End Section Title -->
                @if (session('success10'))
                    <div class="alert alert-success">
                        {{ session('success10') }}
                    </div>
                @endif
                <div class="container">
                    <button id="showcomments" onclick="showcomments()">Show</button>

                    <table id="showcomment" border="1" style="display: none;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Content</th>
                                <th>User Name</th>
                                <th>Created at</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form method="POST">
                                @csrf
                                @method('DELETE')
                                @foreach ($comments as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->content }}</td>
                                        <td>{{ $item->user->name }}</td>
                                        <td>{{ $item->created_at->format('F j, Y, g:i a') }}</td>
                                        <td>
                                            <button type="submit" formaction="destroycomment/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </form>
                        </tbody>
                    </table>

                    <script>
                        function showcomments() {
                            var table = document.getElementById("showcomment");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>
            </section>

            <section id="about" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>About</h2>
                </div><!-- End Section Title -->
                @if (session('success7'))
                    <div class="alert alert-success">
                        {{ session('success7') }}
                    </div>
                @endif
                <div class="container">
                    <button id="Showabout" onclick="showabout()">Show</button>

                    <table id="Showabouts" border="1" style="display: none;">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Subject</th>
                                <th>Subject2</th>
                                <th>Subject3</th>
                                <th>Subject4</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($about as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->title }}</td>
                                    <td>{{ $item->subject }}</td>
                                    <td>{{ $item->subject2 }}</td>
                                    <td>{{ $item->subject3 }}</td>
                                    <td>{{ $item->subject4 }}</td>

                                    <td>
                                        <form method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit"formaction="destroyabout/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>


                    </table>

                    <script>
                        function showabout() {
                            var table = document.getElementById("Showabouts");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="updateabout" onclick="updateabout()"> Update </button>

                    <table id="updateabouts" border="1" style="display: none;">
                        <thead>
                            @foreach ($about as $item)
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Subject</th>
                                    <th>Subject2</th>
                                    <th>Subject3</th>
                                    <th>Subject4</th>
                                </tr>
                                <tr>
                                    <form method="POST" action="updateabout/{{ $item->id }}">
                                        @csrf
                                        <td>{{ $item->id }}</td>
                                        <td><input type="text" name="title" value="{{ $item->title }}"
                                                required></td>
                                        <td><input type="text" name="subject" value="{{ $item->subject }}"
                                                required></td>
                                        <td><input type="text" name="subject2" value="{{ $item->subject2 }}"
                                                required></td>
                                        <td><input type="text" name="subject3" value="{{ $item->subject3 }}"
                                                required></td>
                                        <td><input type="text" name="subject4" value="{{ $item->subject4 }}"
                                                required></td>

                                        <td><button type="submit">Update</button></td>
                                    </form>


                                </tr>
                            @endforeach
                        </thead>
                    </table>

                    <script>
                        function updateabout() {
                            var table = document.getElementById("updateabouts");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                    <button id="insertabout" onclick="insertabout()"> Insert </button>

                    <table id="insertabouts" border="1" style="display: none;">
                        <thead>
                            <form method="POST" action="insertabout">
                                @csrf
                                <tr>
                                    <th>Title</th>
                                    <th>Subject</th>
                                    <th>Subject2</th>
                                    <th>Subject3</th>
                                    <th>Subject4</th>
                                </tr>
                                <tr>
                                    <td><input type="text" name="title" required></td>
                                    <td><input type="text" name="subject" required></td>
                                    <td><input type="text" name="subject2" required></td>
                                    <td><input type="text" name="subject3" required></td>
                                    <td><input type="text" name="subject4" required></td>
                                    <td><button type="submit">insert</button></td>
                            </form>
                            </tr>
                        </thead>
                    </table>

                    <script>
                        function insertabout() {
                            var table = document.getElementById("insertabouts");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>


            </section>
            <section id="services" class="services section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Services</h2>
                </div><!-- End Section Title -->
                @if (session('success8'))
                    <div class="alert alert-success">
                        {{ session('success8') }}
                    </div>
                @endif
                <div class="container">
                    <button id="Showservice" onclick="showservice()">Show</button>

                    <table id="Showservices" border="1" style="display: none;">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>service</th>
                                <th>photo</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($services as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->service }}</td>
                                    <td>{{ $item->photo }}</td>
                                    <td>
                                        <form method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit"formaction="destroyservice/{{ $item->id }}">
                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                    height="20px" width="20px">
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>


                    </table>

                    <script>
                        function showservice() {
                            var table = document.getElementById("Showservices");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>
                    <button id="updateservice" onclick="updatservice()"> Update </button>

                    <table id="updateservices" border="1" style="display: none;">
                        <thead>
                            @foreach ($services as $item)
                                <tr>
                                    <th>ID</th>
                                    <th>service</th>
                                    <th>photo</th>
                                </tr>
                                <tr>
                                    <form method="POST" action="updateservice/{{ $item->id }}"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <td>{{ $item->id }}</td>
                                        <td><input type="text" name="service" value="{{ $item->service }}"
                                                required></td>
                                        <td><input type="file" name="photo" value="{{ $item->photo }}"
                                                required></td>
                                        <td><button type="submit">Update</button></td>
                                    </form>


                                </tr>
                            @endforeach
                        </thead>
                    </table>

                    <script>
                        function updatservice() {
                            var table = document.getElementById("updateservices");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                    <button id="insertservice" onclick="insertservice()"> Insert </button>

                    <table id="insertservices" border="1" style="display: none;">
                        <thead>
                            <form method="POST" action="insertservice" enctype="multipart/form-data">
                                @csrf
                                <tr>
                                    <th>service</th>
                                    <th>photo</th>
                                </tr>
                                <tr>
                                    <td><input type="text" name="service" required></td>
                                    <td><input type="file" name="photo" required></td>
                                    <td><button type="submit">insert</button></td>
                            </form>
                            </tr>
                        </thead>
                    </table>

                    <script>
                        function insertservice() {
                            var table = document.getElementById("insertservices");
                            if (table.style.display === "none") {
                                table.style.display = "table";
                            } else {
                                table.style.display = "none";
                            }
                        }
                    </script>

                </div>


            </section>

        </main>

        <footer id="footer" class="footer">
            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="/" class="d-flex align-items-center">
                            <span class="sitename">TechAi</span>
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
