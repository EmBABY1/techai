@extends('profile.myprofile')
@section('content')
    <!DOCTYPE html>
    <html lang="en">

        <head>
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
                    background-color: #007bff;
                    /* Blue background for card header */
                    color: #fff;
                    /* White text color for card header */
                    border-radius: 15px 15px 0 0;
                }

                .card-body {
                    background-color: #fff;
                    border-radius: 0 0 15px 15px;
                }

                .btn:hover {
                    background-color: #0056b3;
                    border-color: #0056b3;
                }

                .remaining-time {
                    font-weight: bold;
                    color: #28a745;
                    /* Green color for positive remaining time */
                }

                .user-info {
                    margin-bottom: 15px;
                    padding-bottom: 10px;
                    border-bottom: 1px solid #dee2e6;
                    /* Add a border bottom for user info sections */
                }

                .user-info strong {
                    font-weight: bold;
                    color: #007bff;
                    /* Blue color for user info labels */
                }


                /* Additional styling for colorful elements */
                .primary-color {
                    color: #007bff;
                }

                .success-color {
                    color: #28a745;
                }

                .danger-color {
                    color: #dc3545;
                }

                .warning-color {
                    color: #ffc107;
                }

                .info-color {
                    color: #17a2b8;
                }
            </style>
        </head>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <br>
                    <div class="card-header">
                        Your Package Details
                    </div>

                    <div class="card-body">
                        @foreach ($myplans as $key => $item)
                            <div class="user-info">
                                <div class="row">
                                    <div class="col-md-6">
                                        <strong class="success-color">Package Name:</strong> {{ $item->package_name }}
                                    </div>
                                </div>
                            </div>
                            <div class="user-info">
                                <div class="row">
                                    <div class="col-md-6">
                                        <strong class="danger-color">From:</strong> {{ $item->from_date }}
                                    </div>
                                    <div class="col-md-6">
                                        <strong class="danger-color">To:</strong> {{ $item->to_date }}
                                    </div>
                                </div>
                            </div>
                            <input type="datetime" value="{{ $item->from_date }}" name="date1" hidden>
                            <div class="user-info">
                                <div class="row">
                                    <div class="col-md-12">
                                        <strong class="warning-color">Remaining Time:</strong> <span
                                            class="remaining-time">{{ $remainingTimes[$key] }}</span>
                                    </div>
                                </div>
                            </div>
                            <form method="POST" action="/destroysubscript/{{ $item->subscription_id }}">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-primary btn-lg px-4 py-2"
                                    style="margin-left: 38% ;background-color: red!important">
                                    Delete Subscription
                                </button>
                            </form>
                        @endforeach
                        <div class="col-md-12 text-center mt-4">
                            <button class="btn btn-primary btn-lg px-4 py-2">
                                <a href="{{ route('welcome') }}#pricing" class="text-white text-decoration-none">Add New
                                    Plan</a>
                            </button>
                            @if ($remainingTimes[$key] == '0 years, 0 months, 0 days, 0 hours, 0 minutes, 0 seconds')
                                <form id="autoSubmitForm" method="POST"
                                    action="{{ url('destroysubscriptor/' . $item->subscription_id) }}">
                                    @csrf
                                    @method('DELETE')
                                </form>
                                <script type="text/javascript">
                                    document.getElementById('autoSubmitForm').submit();
                                </script>
                            @else
                                <button class="btn btn-primary btn-lg px-4 py-2">
                                    <a href="{{ route('upload') }}" class="text-white text-decoration-none">Use Your
                                        Package</a>
                                </button>
                            @endif

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
