@extends('profile.myprofile')
@section('content')
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Image Enhancement</title>
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
                    background-color: #17a2b8;
                    color: #fff;
                }

                .btn-info {
                    background-color: #17a2b8;
                    border: none;
                }

                .btn-info:hover {
                    background-color: #138496;
                }

                .enhanced-image {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header text-center">
                                <h4>Upload Image for Enhancement</h4>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('enhance-image') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group">
                                        <label for="image">Select Image</label>
                                        <input type="file" name="image" class="form-control-file" id="image"
                                            required>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-block">Upload</button>
                                </form>
                            </div>
                        </div>
                        @if (session('enhanced_image'))
                            <div class="mt-4 enhanced-image">
                                <h5>Enhanced Image:</h5>
                                <img src="{{ session('enhanced_image') }}" alt="Enhanced Image" class="img-fluid"
                                    style="max-width: 100%; height: auto;">
                                <br>
                                <a href="{{ asset('images/enhanced_image.jpg') }}" download="enhanced_image.jpg"
                                    class="btn btn-secondary mt-3">Download Enhanced Image</a>
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
