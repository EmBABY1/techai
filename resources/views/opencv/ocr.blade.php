@extends('profile.myprofile')
@section('content')
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Upload Image</title>
            <!-- Bootstrap CSS -->
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
            <!-- Custom CSS -->
            <style>
                body {
                    background-color: #f8f9fa;
                    font-family: Arial, sans-serif;
                }

                .container {
                    margin-top: 50px;
                }

                .card {
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    border: none;
                }

                .card-header {
                    background-color: #007bff;
                    color: #fff;
                }

                .btn-primary {
                    background-color: #007bff;
                    border: none;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                }

                .extracted-text {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header text-center">
                                <h4>Upload Image to Extract Text</h4>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('extract-text') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group">
                                        <label for="image">Select Image</label>
                                        <input type="file" name="image" class="form-control-file" id="image"
                                            required>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Upload</button>
                                </form>
                            </div>
                        </div>
                        @if (session('extracted_text'))
                            <div class="mt-4 extracted-text">
                                <h5>Extracted Text:</h5>
                                <p>{{ session('extracted_text') }}</p>
                            </div>
                        @endif
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS and dependencies -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

    </html>
@endsection
