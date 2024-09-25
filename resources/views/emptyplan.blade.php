@extends('profile.myprofile')
@section('content')
<!DOCTYPE html>
<html lang="en">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

        .card {
            margin-top: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff; /* Blue background for card header */
            color: #000000; /* White text color for card header */
            border-radius: 15px 15px 0 0;
        }
        .card-body {
            background-color: #fff;
            border-radius: 0 0 15px 15px;
        }

        .remaining-time {
            font-weight: bold;
            color: #28a745; /* Green color for positive remaining time */
        }
        .user-info {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #dee2e6; /* Add a border bottom for user info sections */
        }
        .user-info strong {
            font-weight: bold;
            color: #007bff; /* Blue color for user info labels */
        }

        /* Additional styling for colorful elements */


    </style>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        It Seems You Don't Have a Plan
                    </div>
                    <div class="card-body">
                        <div class="col-md-12 text-center mt-4">
                            <button class="btn btn-primary btn-lg px-4 py-2">
                                <a href="{{ route('welcome') }}#pricing" class="text-white text-decoration-none">Buy a Plan</a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>

    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

@endsection
