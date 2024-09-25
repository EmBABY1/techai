<!DOCTYPE html>
<html>

    <head>
        <title>Stripe Payment</title>
        <script src="https://js.stripe.com/v3/"></script>

        <style>
            body {
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, #f7f7f7 25%, #e2e2e2 100%);
                margin: 0;
            }

            .navbar {
                width: 100%;
                height: 80px;
                background-color: #0d0538;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .navbar .link {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 18px 25px;
                text-decoration: none;
            }

            .navbar .link:hover {
                background-color: #ddd;
                color: black;
            }

            .container {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 8px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
                margin-top: 20px;
            }

            h2 {
                margin-bottom: 20px;
                color: #333;
                font-size: 26px;
                font-weight: 600;
            }

            .alert {
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                text-align: center;
                font-weight: 500;
            }

            .alert-success {
                background-color: #dff0d8;
                color: #3c763d;
                border: 1px solid #c1e2b3;
            }

            .alert-error {
                background-color: #f2dede;
                color: #a94442;
                border: 1px solid #ebcccc;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
                color: #555;
            }

            #card-element {
                background-color: #f8f8f8;
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 12px;
            }

            #card-errors {
                color: #fa755a;
                margin-top: 10px;
                text-align: center;
                font-weight: 500;
            }

            button {
                background-color: #6772e5;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 12px 25px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                margin-top: 25px;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #5469d4;
            }

            .packages-list {
                margin-top: 20px;
                text-align: left;
            }

            .package-item {
                background: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 10px;
            }

            @media (max-width: 480px) {
                .container {
                    padding: 10px;
                }

                h2 {
                    font-size: 22px;
                }

                button {
                    font-size: 14px;
                    padding: 10px 20px;
                }
            }
        </style>
    </head>

    <body>
        <div class="navbar">
            <a href="/" class="logo d-flex align-items-center me-auto">
                <x-application-logo class="block h-9 w-auto fill-current text-gray-800 dark:text-gray-200"
                    style="width: 100px;height: 80px;" />
            </a>
            <a href="/myplans" class="link">My Plans</a>
            <a href="{{ route('welcome') }}" class="link">Home</a>
            <a href="{{ route('welcome') }}" class="link">About</a>
            <a href="{{ route('welcome') }}" class="link">Services</a>
            <a href="{{ route('welcome') }}" class="link">Contact</a>
        </div>
        <div class="container">
            <h2>Make a Payment</h2>

            @if (session('success_message'))
                <div class="alert alert-success">
                    {{ session('success_message') }}
                </div>
            @endif

            @if (session('error_message'))
                <div class="alert alert-error">
                    {{ session('error_message') }}
                </div>
            @endif

            <form action="{{ route('payment.process') }}" method="POST" id="payment-form">
                @csrf
                <label for="card-element">Credit or debit card</label>
                <div id="card-element"></div>
                <div id="card-errors" role="alert"></div>

                <input type="hidden" name="amount" value="100"> <!-- Amount in dollars -->

                <div class="packages-list">
                    <h3>Package Details</h3>
                    @foreach ($packages as $item)
                        <input type="hidden" name="package_id" value="{{ $item->id }}">
                        <input type="hidden" name="duration" value="{{ $item->duration }}">
                        <input type="hidden" name="package_name" value="{{ $item->name }}">
                        <input type="hidden" name="property2" value="{{ $item->property2 }}">
                        <input type="hidden" name="property3" value="{{ $item->property3 }}">
                        <input type="hidden" name="property4" value="{{ $item->property4 }}">

                        <div class="package-item">
                            Name: {{ $item->name }}
                        </div>
                        <div class="package-item">
                            Price: {{ $item->price }}
                        </div>
                        <div class="package-item">
                            Duration: {{ $item->duration }}
                        </div>

                        <div class="package-item">
                            Prop2: {{ $item->property2 }}
                        </div>
                    @endforeach
                </div>

                <button type="submit">Submit Payment</button>
            </form>
        </div>

        <script>
            var stripe = Stripe('{{ env('STRIPE_KEY') }}');
            var elements = stripe.elements();

            var style = {
                base: {
                    color: '#32325d',
                    lineHeight: '24px',
                    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                    fontSmoothing: 'antialiased',
                    fontSize: '16px',
                    '::placeholder': {
                        color: '#aab7c4'
                    }
                },
                invalid: {
                    color: '#fa755a',
                    iconColor: '#fa755a'
                }
            };

            var card = elements.create('card', {
                style: style
            });
            card.mount('#card-element');

            card.addEventListener('change', function(event) {
                var displayError = document.getElementById('card-errors');
                if (event.error) {
                    displayError.textContent = event.error.message;
                } else {
                    displayError.textContent = '';
                }
            });

            var form = document.getElementById('payment-form');
            form.addEventListener('submit', function(event) {
                event.preventDefault();

                stripe.createToken(card).then(function(result) {
                    if (result.error) {
                        var errorElement = document.getElementById('card-errors');
                        errorElement.textContent = result.error.message;
                    } else {
                        stripeTokenHandler(result.token);
                    }
                });
            });

            function stripeTokenHandler(token) {
                var form = document.getElementById('payment-form');
                var hiddenInput = document.createElement('input');
                hiddenInput.setAttribute('type', 'hidden');
                hiddenInput.setAttribute('name', 'stripeToken');
                hiddenInput.setAttribute('value', token.id);
                form.appendChild(hiddenInput);

                form.submit();
            }
        </script>
    </body>

</html>
