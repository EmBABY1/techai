

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forget Your Password</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="assets/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="assets/images/signin-image.jpg" alt="sing up image"></figure>
                </div>

                <div class="signin-form">
                    <div class="mb-4 text-sm text-gray-600 dark:text-gray-400">
                        {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
                    </div>
                    <x-auth-session-status class="mb-4" :status="session('status')" style="color: green" />

                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf
                
                        <!-- Email Address -->
                        <div>
                            <div class="form-group">
                                <label><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input id="email"  placeholder="Your Name" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
                                <x-input-error :messages="$errors->get('email')" class="mt-2" /> 
                            </div>
                        </div>
                
                        <div class="flex items-center justify-end mt-4">
                            <x-primary-button class="form-submit">
                                {{ __('Email Password Reset Link') }}
                            </x-primary-button>
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </section>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/js/main1.js"></script>