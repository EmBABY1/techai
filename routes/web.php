<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckRequests;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Controllers\AboutController;
use App\Http\Controllers\VideoController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\WelcomeController;
use App\Http\Controllers\PackagesController;
use App\Http\Controllers\ServicesController;
use App\Http\Controllers\ContactusController;
use App\Http\Controllers\OpenCV\OcrController;
use App\Http\Controllers\AdminPannelController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\Api\PhotoUploadController;
use App\Http\Controllers\OpenCV\FaceRecognitionController;
use App\Http\Controllers\OpenCV\ImageEnhancementController;
use App\Http\Controllers\OpenCV\ObjectRecognitionController;
use App\Http\Controllers\OpenCV\EmotionRecognitionController;


//welcomee
Route::get('/', [WelcomeController::class, 'index'])->name('welcome');
//contactus
Route::post('/contactus', [ContactusController::class, 'contactus']);
//comments
Route::get('/comments', [CommentController::class, 'showComments']);
//dashboard

//auth
Route::middleware('auth')->group(function () {
    Route::post('/change_photo', [ProfileController::class, 'change_photo']);

    //profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    //My requests

    //payment
    Route::get('/payments/{id}', [StripePaymentController::class, 'show'])->name('payments.show');
    Route::post('/payment', [StripePaymentController::class, 'process'])->name('payment.process');
    //plan
    Route::get('/myplans', [SubscriptionController::class, 'myplans'])->name('myplans');
    Route::get('/emptyplan', [SubscriptionController::class, 'myplans'])->name('myplans');
    //destroy plan
    Route::delete('/destroysubscript/{id}', [SubscriptionController::class, 'destroy']);
    //comments
    Route::post('/comments', [CommentController::class, 'store']);

    //
    Route::get('/use_requests', [ProfileController::class, 'use_requests'])->name('use_requests');
    //send photos
    Route::get('/menu', [ProfileController::class, 'menu'])->name('use_requests');

    Route::get('/upload', [PhotoUploadController::class, 'upload'])->middleware('auth:sanctum')->name('upload');
    Route::get('/myprofile', [ProfileController::class, 'myprofile'])->name('myprofile');

    //recognition
    Route::get('/facerecognition', [FaceRecognitionController::class, 'index'])->name('facerecognition');
    Route::post('/detect-faces', [FaceRecognitionController::class, 'detectFaces'])->name('detect-faces');

    //enhance
    Route::get('/enhanceimage', [ImageEnhancementController::class, 'index'])->name('enhanceimage');
    Route::post('/enhance-image', [ImageEnhancementController::class, 'enhanceImage'])->name('enhance-image');

    //ocr
    Route::get('/extracttext', [OcrController::class, 'index'])->name('extracttext');
    Route::post('/extract-text', [OcrController::class, 'extractText'])->name('extract-text');

    //emotion recognition
    Route::get('/detectemotion', [EmotionRecognitionController::class, 'index'])->name('detectemotion');
    Route::post('/detect-emotion', [EmotionRecognitionController::class, 'detectEmotion'])->name('detect-emotion');

    //detect objects
    Route::get('/detectobjects', [ObjectRecognitionController::class, 'index'])->name('detectobjects');
    Route::post('/detect-objects', [ObjectRecognitionController::class, 'detect'])->name('detect-objects');
});





//Admin Pannel

Route::middleware(AdminMiddleware::class)->group(function () {

    Route::get('/admin', [AdminPannelController::class, 'admin'])->middleware(AdminMiddleware::class)->name('admin');
    Route::get('/Adashboard', [AdminPannelController::class, 'Adashboard'])->name('Adashboard');
    Route::get('/financial', function () {
        $financial = DB::select('with package_totals AS ( SELECT COUNT(s.package_id) AS no_of_subscriptions, s.package_id, p.name, p.price, COUNT(s.package_id) * p.price AS total_price_of_each_package FROM payments s JOIN packages p ON s.package_id = p.id GROUP BY s.package_id, p.name, p.price ), total_sum AS ( SELECT SUM(total_price_of_each_package) AS total_price_of_all_packages FROM package_totals ) SELECT pt.no_of_subscriptions, pt.package_id, pt.name, pt.price, pt.total_price_of_each_package, ts.total_price_of_all_packages FROM package_totals pt, total_sum ts;');

        return view('admin.financial', ['financial' => $financial]);
    })->name('financial');
    Route::get('/payments', [StripePaymentController::class, 'index'])->name('payments');

    Route::get('/adminpannel', [AdminPannelController::class, 'index'])->middleware(AdminMiddleware::class)->name('adminpannel');
    //USER

    Route::controller(UserController::class)->group(function () {
        Route::get('/user', 'index')->name('user');
        Route::delete('/destroyuser/{id}', 'destroy');
        Route::post('/storeuser', 'store');
        Route::post('/updateuser/{id}', 'update');
    });

    //PACKAGE
    Route::controller(PackagesController::class)->group(function () {
        Route::get('/package', 'index')->name('package');
        Route::delete('/destroypackage/{id}', 'destroy');
        Route::post('/insertpackage', 'insert');
        Route::post('/updatepackage/{id}', 'update');
    });
    //NEWS
    Route::controller(NewsController::class)->group(function () {
        Route::get('/news', 'index')->name('news');
        Route::delete('/destroynews/{id}', 'destroy');
        Route::post('/insertnews', 'insert');
        Route::post('/updatenews/{id}', 'update');
    });

    //SUBSCRIPTION
    Route::controller(SubscriptionController::class)->group(function () {
        Route::get('/subscription', 'index')->name('subscription');
        Route::delete('/destroysubscriptor/{id}', 'destroy');
        Route::post('/insertsubscriptor', 'insert');
        Route::post('/updatesubscriptor/{id}', 'update');
    });
    //COMMENTS
    Route::controller(CommentController::class)->group(function () {
        Route::get('/comment', 'index')->name('comment');
        Route::delete('/destroycomment/{id}', 'destroy');
    });
    //COMPLAINS
    Route::controller(ContactusController::class)->group(function () {
        Route::get('/complain', 'index')->name('complain');
        Route::delete('/destroycomplain/{id}', 'destroy');
    });
    //About
    Route::controller(AboutController::class)->group(function () {
        Route::get('/about', 'index')->name('about');
        Route::delete('/destroyabout/{id}', 'destroy');
        Route::post('/insertabout', 'insert');
        Route::post('/updateabout/{id}', 'update');
    });
    //Service
    Route::controller(ServicesController::class)->group(function () {
        Route::get('/services', 'index')->name('services');
        Route::delete('/destroyservice/{id}', 'destroy');
        Route::post('/insertservice', 'insert');
        Route::post('/updateservice/{id}', 'update');
    });
});



require __DIR__ . '/auth.php';