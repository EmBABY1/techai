@extends('profile.myprofile')
@section('content')
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Circular Buttons</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
            <style>
                .circular-button {
                    width: 250px;
                    height: 250px;
                    border-radius: 50%;
                    background-color: #28a745;
                    color: white;
                    border: none;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    margin: 10px;
                    cursor: pointer;
                    transition: background-color 0.3s, transform 0.3s;
                    overflow: hidden;
                }

                .circular-button img {
                    width: 150px;
                    height: 150px;
                    margin-bottom: 10px;
                }

                .circular-button p {
                    margin: 0;
                    font-size: 14px;
                }

                .circular-button:hover {
                    background-color: #218838;
                    transform: scale(1.1);
                }
            </style>
        </head>

        <body>
            <div class="container text-center" style="margin-top: 100px;">
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <button class="circular-button" onclick="window.location.href='{{ route('enhanceimage') }}'">
                            <img src="{{ asset('assets\opencvimages\enhance.webp') }}" alt="Enhance Image">
                            <p>Enhance Image</p>
                        </button>
                    </div>
                    <div class="col-auto">
                        <button class="circular-button"
                            style="background-color: #007bff;"onclick="window.location.href='{{ route('facerecognition') }}'">
                            <img src="{{ asset('assets\opencvimages\facedetection.jpg') }}" alt="Face Detection">
                            <p>Face Detection</p>
                        </button>
                    </div>
                    <div class="col-auto">
                        <button class="circular-button" style="background-color: #dc3545;"onclick="
                            window.location.href='{{ route('extracttext') }}'">
                            <img src="{{ asset('assets\opencvimages\ocr.png') }}" alt="OCR">
                            <p>OCR</p>
                        </button>
                    </div>
                    <div class="col-auto">
                        <button class="circular-button" style="background-color: #ffc107;"onclick="
                            window.location.href='{{ route('detectobjects') }}'">
                            <img src="{{ asset('assets\opencvimages\objectdetected.jpg') }}" alt="Object Detection">
                            <p>Object Detection</p>
                        </button>
                    </div>
                    <div class="col-auto">
                        <button class="circular-button" style="background-color: #030303;"onclick="
                            window.location.href='{{ route('detectemotion') }}'">
                            <img src="{{ asset('assets\opencvimages\emotion.jpg') }}" alt="Emotion Detection">
                            <p>Emotion Detection</p>
                        </button>
                    </div>
                </div>
            </div>

            <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        </body>

    </html>
@endsection
