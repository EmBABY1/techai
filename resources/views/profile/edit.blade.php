@extends('profile.myprofile')
@section('content')

<div class="py-12" style="margin: 10%">
<div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">

        <div class="max-w-xl">
           <h2>Profile Photo</h2>
              <div class="profile-photo-container">
                <img src="{{Auth::user()->photo}}" alt="image profile" class="avatar-img rounded" id="profileImage" style="width: 250px">
                <button class="change-photo-btn" id="changePhotoButton">Change Photo</button>
                <form action="change_photo" method="POST" enctype="multipart/form-data">
                    @csrf
                <input type="file" id="fileInput" accept="image/*" style="display: none;" name="photo"><br>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>

              </div>
            <style>.profile-photo-container {
                position: relative;
                display: inline-block;
              }

              .avatar-img {
                display: block;
                border-radius: 50%;
              }

              .change-photo-btn {
                display: none;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 10px 20px;
                background-color: rgba(0, 0, 0, 0.5);
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
              }

              .profile-photo-container:hover .change-photo-btn {
                display: block;
              }
            </style>
            <script>
                document.getElementById('changePhotoButton').addEventListener('click', function() {
                    document.getElementById('fileInput').click();
                  });

                  document.getElementById('fileInput').addEventListener('change', function(event) {
                    if (event.target.files && event.target.files[0]) {
                      var reader = new FileReader();
                      reader.onload = function(e) {
                        document.getElementById('profileImage').src = e.target.result;
                        // Here you can also send the image file to the server if needed
                      }
                      reader.readAsDataURL(event.target.files[0]);
                    }
                  });

            </script>
        </div>

    </div>
    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">

        <div class="max-w-xl">
            @include('profile.partials.update-profile-information-form')
        </div>

    </div>

    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
        <div class="max-w-xl">
            @include('profile.partials.update-password-form')
        </div>
    </div>

    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
        <div class="max-w-xl">
            @include('profile.partials.delete-user-form')
        </div>
    </div>
</div>
</div>
@endsection
