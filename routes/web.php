<?php

  Route::get('user/activate/{user_email}', 'UserController@userActivate');
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*======================================
=            Theme Routes            =
======================================*/
Auth::routes();


Route::get('/testmonthly','NewsLetterController@monthyTopResourcesNewsleter');


Route::get('/home', 'ThemeController@index')->name('theme.home');

Route::get('/resources','ThemeController@resources')->name('theme.resources');

Route::get('/resource/author/{user}','ThemeController@authorProfile')->name('theme.resources.authorprofile');

Route::post('/resource/author/sendmail','ThemeController@authorProfile__SendMail')->name('theme.resources.authorprofile.mail');

Route::get('/resources/category/{category}/{rid?}','ThemeController@resourcesByCategory')->name('theme.resourcesbycategory');

Route::get('/resources/tag/{tag}/{rid?}','ThemeController@resourcesByTag')->name('theme.resourcesbytag');

Route::get('/resource/{resource}','ThemeController@singleResource')->name('theme.singleresource');

Route::get('/pending-resource/{resource}','ThemeController@singlePendingResource');

Route::post('/resource/review','ThemeController@addReviewToResource')->name('theme.addreviewtoresource')->middleware('auth');

Route::post('/resource/review/{review}/update','ThemeController@updateReviewFromResource')->name('theme.updatereviewfromresource')->middleware('auth');

Route::get('/resource/review/{review}/delete','ThemeController@deleteReviewFromResource')->name('theme.deletereviewfromresource')->middleware('auth');

Route::post('/resource/flag','ThemeController@flagResource')->name('theme.flagresource')->middleware('auth');

Route::get('/resources/filtered','ThemeController@filteredResources')->name('theme.resources.filtered');

Route::post('/resource/comment','ResourceCommentController@store')->name('theme.resources.comment');

Route::get('/resource/comment/{comment}/delete','ResourceCommentController@destroy')->name('theme.resources.comment.destroy');

Route::get('/support-us','ThemeController@supportUs')->name('theme.supportus');

Route::post('/support-us/donate','ThemeController@supportUsDonationOneTime')->name('theme.supportus.donationonetime');

Route::post('/support-us/donate/monthly','ThemeController@supportUsDonationMonthly')->name('theme.supportus.donationmonthly');

Route::get('/resources/saved','ThemeController@savedResources')->name('theme.savedresources')->middleware('auth');

Route::post('/resource/save','ThemeController@saveResource')->name('theme.saveresource.ajax');

Route::get('/resource/{resource}/unsave','ThemeController@unSaveResource')->name('theme.unsaveresource')->middleware('auth');

Route::post('/resource/like','ThemeController@likeResource')->name('theme.likeresource.ajax');

Route::get('/resource/{resource}/download','ThemeController@downloadResource')->name('theme.downloadresource')->middleware('auth');

Route::get('/contactus','ThemeController@contactus')->name('theme.contactus');

Route::post('/contactus/sendmail','ThemeController@sendContactMail')->name('theme.contactus.sendmail');

Route::post('/newsletter/subscribe','NewsLetterController@subscribe')->name('theme.newslettersubscription');


Route::get('/author/{id}/follow', 'ThemeController@authorFollow');

Route::get('/terms-and-conditions',function(){
	$tac = \App\Page::where('name', 'terms')->first()->content;
	return view('layouts.terms_conditions',compact('tac'));
});

Route::get('/privacy-policy',function(){
	$pp = \App\Page::where('name', 'privacy')->first()->content;
	return view('layouts.privacy_policy',compact('pp'));
});


/* Admin Route Start */
Route::prefix('admin')
		->middleware(['auth', 'web', 'admin'])
		->namespace('Admin')
		->group(function(){

	Route::get('/dashboard', 'AdminController@index')->name('admin.dashboard.index');

	Route::get('/published-resources', 'AdminController@publishedResources')->name('admin.publishedResources.list');
	Route::get('/published-resources/pajax', 'AdminController@publishedResourcesPAjax')->name('admin.publishedResources.list.pajax');
	Route::prefix('published-resource')->group(function(){
		Route::get('/del/{id}', 'AdminController@delPublishedResource')->name('admin.publishedResource.delete');
		Route::post('/ban/{id}', 'AdminController@banPublishedResource')->name('admin.publishedResource.ban');
		Route::get('/featured/{id}', 'AdminController@featuredPublishedResource')->name('admin.publishedResource.featured');
		
	});





	Route::get('/pending-resources', 'AdminController@pendingResources')->name('admin.pendingResources.list');
	Route::get('/pending-resources/pajax', 'AdminController@pendingResourcesPAjax')->name('admin.pendingResources.list.pajax');
	Route::prefix('pending-resource')->group(function(){
		Route::get('/app/{id}', 'AdminController@approvePendingResource')->name('admin.pendingResource.approve');
	});



	Route::get('/my-resources', 'AdminController@myResources')->name('admin.myResources.list');
	Route::get('/my-resources/pajax', 'AdminController@myResourcesPAjax')->name('admin.myResources.list.pajax');
	Route::get('/my-resources/del/{id}', 'AdminController@delMyResources')->name('admin.delMyResources');


	Route::get('resource/create', 'AdminController@createResources')->name('admin.create.resource');
	Route::post('resource/create', 'AdminController@saveResources')->name('admin.create.resource.save');
	Route::get('resource/edit/{id}', 'AdminController@editResources')->name('admin.create.resource.edit');



	Route::get('/subscribers', 'AdminController@subscribers')->name('admin.subscribers.list');
	Route::get('/subscribers/pajax', 'AdminController@subscribersPAjax')->name('admin.subscribers.list.pajax');
	Route::prefix('subscriber')->group(function(){
		Route::get('/del/{id}', 'AdminController@delSubscriber')->name('admin.subscriber.delete');
		Route::get('/ban/{id}', 'AdminController@banSubscriber')->name('admin.subscriber.ban');
	});

	Route::get('/donations', 'AdminController@donations')->name('admin.donations.list');
	Route::get('/donations/pajax', 'AdminController@donationsPAjax')->name('admin.donations.list.pajax');


	Route::get('/users', 'AdminController@users')->name('admin.users.list');
	Route::get('/users/pajax', 'AdminController@usersPAjax')->name('admin.users.list.pajax');

	Route::get('/users/get/{type}', 'AdminController@getUsersTypeList')->name('admin.users.type.list');

	Route::get('/users/get/{type}/pajax', 'AdminController@getUsersTypeListPAjax')->name('admin.users.type.list.pajax');

	Route::prefix('user')->group(function(){
		Route::post('/contact/{id}', 'AdminController@userContact')->name('admin.user.contact');
		Route::get('/block/{id}', 'AdminController@userBlock')->name('admin.user.block');
		Route::get('/del/{id}', 'AdminController@userDelete')->name('admin.user.delete');
		Route::get('/notice/{id}', 'AdminController@userNotice')->name('admin.user.notice');
		Route::get('/verify/{id}', 'AdminController@userVerify')->name('admin.user.verify');
		Route::get('/setm/{id}', 'AdminController@userSetModarator')->name('admin.user.setmod');
		Route::get('/u_setm/{id}', 'AdminController@userUnSetModarator')->name('admin.user.unsetmod');
		Route::get('/setad/{id}', 'AdminController@userSetadmin')->name('admin.user.setad');
		Route::get('/u_setad/{id}', 'AdminController@userUnSetadmin')->name('admin.user.unsetad');
	});


	Route::get('/flaged-resources', 'AdminController@flagedResources')->name('admin.flagedResources.list');
	Route::get('/flaged-resources/pajax', 'AdminController@flagedResourcesPAjax')->name('admin.flagedResources.list.pajax');
	Route::prefix('flaged-resource')->group(function(){
		Route::get('/notice/{id}', 'AdminController@flagedResourceNotice')->name('admin.flagedResource.notice');
		Route::get('/del/{id}', 'AdminController@delFlagedResource')->name('admin.delFlagedResource');
		Route::get('/rem-flag/{id}', 'AdminController@remFlagedResource')->name('admin.remFlagedResource');
	});



	Route::get('/own/profile', 'AdminController@ownProfile')->name('admin.own.profile.form');
	Route::get('/own/password', 'AdminController@ownProfilePassword')->name('admin.own.profile.password');



	Route::get('/privacy-policy', 'AdminController@editPrivacyPolicy')->name('admin.privacy.form');
	Route::post('/privacy-policy', 'AdminController@savePrivacyPolicy')->name('admin.privacy.update');

	Route::get('/terms-and-conditions', 'AdminController@editTerms')->name('admin.terms.form');
	Route::post('/terms-and-conditions', 'AdminController@saveTerms')->name('admin.terms.update');


	Route::get('/testimonials', 'AdminController@testimonials')->name('admin.testimonial.list');
	Route::get('/testimonials/pajax', 'AdminController@testimonialsPAjax')->name('admin.testimonial.list.pajax');
	Route::get('/testimonial/edit/{id}', 'AdminController@editTestimonials')->name('admin.testimonial.form');
	Route::post('/testimonial/update/{id?}', 'AdminController@updateTestimonials')->name('admin.testimonial.update');
	Route::post('/testimonial/create/', 'AdminController@createTestimonials')->name('admin.testimonial.create');
	Route::post('/testimonial/del/{id}', 'AdminController@delTestimonials')->name('admin.testimonial.delete');


	Route::post('/user/create/', 'AdminController@createUser')->name('admin.user.create');


	Route::get('/header-images', 'AdminController@headerImageList')->name('admin.headerImage.list');
	Route::post('/header-images', 'AdminController@headerImageUpload')->name('admin.headerImage.upload');

	Route::post('/resource/tags-categories/save', 'AdminController@tagsCategoriesSave')->name('admin.tagCategories.save');
	Route::get('/resource/tags-categories/del/{ct}/{id}', 'AdminController@tagsCategoriesDel')->name('admin.tagCategories.del');
	Route::get('/resource/tags-categories', 'AdminController@tagsCategories')->name('admin.tagCategories.list');



	Route::get('/faqs', 'AdminController@faqsList')->name('admin.faq.list');
	Route::post('/faq/update', 'AdminController@faqsUpdate')->name('admin.faq.update');
	Route::get('faq/getquestions/{id}','AdminController@getQuestions')->name('admin.faq.getQuestions');
	Route::get('faq/question/del/{id}','AdminController@delQuestions')->name('admin.faq.delQuestions');


	Route::get('remove-following/{id}', 'AdminController@remFollwing');

	Route::get('notifications', 'AdminController@notifications')->name('admin.all.notifications');

	Route::get('/download-history', 'AdminController@downloadHistoryList')->name('admin.download.history.list');

	Route::get('/download-history/del/{id}', 'AdminController@downloadHistoryRemoveById');
	Route::get('/download-history/batch-del/{id}', 'AdminController@downloadHistoryRemoveByBatch');


	Route::get('/viewing-history', 'AdminController@viewingHistoryList')->name('admin.viewing.history.list');

	Route::get('/viewing-history/del/{id}', 'AdminController@viewingHistoryRemoveById');
	Route::get('/viewing-history/batch-del/{id}', 'AdminController@viewingHistoryRemoveByBatch');

	Route::get('/saved-resource/del/{id}', 'AdminController@delSavedResource')->name('admin.view.savedResource.del');
	Route::get('/saved-resource', 'AdminController@viewSavedResource')->name('admin.view.savedResource.list');


	Route::get('/reported-user', 'AdminController@viewReportedUsers')->name('admin.view.reportedUsers.list');
	Route::get('/reported-user/pajax', 'AdminController@viewReportedUsersPajax')->name('admin.view.reportedUsers.list.pajax');

});

/* User dashboard */

Route::prefix('user')->middleware(['auth', 'web'])->namespace('User')->group(function(){
	Route::post('/profile/update', 'UserController@updateProfile')->name('user.profile.update');
	Route::get('/profile', 'UserController@ownProfile')->name('user.profile.form');

	Route::get('/own/password', 'UserController@ownProfilePassword')->name('user.own.profile.password');
	Route::post('/own/password', 'UserController@ownProfilePasswordSave')->name('user.own.profile.password.save');

	Route::get('/dashboard', 'UserController@index')->name('user.dashboard.index');

	Route::get('/published-resources', 'UserController@publishedResources')->name('user.publishedResources.list');
	Route::get('/published-resources/pajax', 'UserController@publishedResourcesPAjax')->name('user.publishedResources.list.pajax');
	Route::prefix('published-resource')->group(function(){
		Route::get('/del/{id}', 'UserController@delPublishedResource')->name('user.publishedResource.delete');
		Route::post('/ban/{id}', 'UserController@banPublishedResource')->name('user.publishedResource.ban');
		Route::get('/featured/{id}', 'UserController@featuredPublishedResource')->name('user.publishedResource.featured');
		
	});





	Route::get('/pending-resources', 'UserController@pendingResources')->name('user.pendingResources.list');
	Route::get('/pending-resources/pajax', 'UserController@pendingResourcesPAjax')->name('user.pendingResources.list.pajax');
	Route::prefix('pending-resource')->group(function(){
		Route::get('/app/{id}', 'UserController@approvePendingResource')->name('user.pendingResource.approve');
	});



	Route::get('/my-resources', 'UserController@myResources')->name('user.myResources.list');
	Route::get('/my-resources/pajax', 'UserController@myResourcesPAjax')->name('user.myResources.list.pajax');
	Route::get('/my-resources/del/{id}', 'UserController@delMyResources')->name('user.delMyResources');


	Route::get('resource/create', 'UserController@createResources')->name('user.create.resource');
	Route::post('resource/create', 'UserController@saveResources')->name('user.create.resource.save');
	Route::get('resource/edit/{id}', 'UserController@editResources')->name('user.create.resource.edit');



	Route::get('/flaged-resources', 'UserController@flagedResources')->name('user.flagedResources.list');
	Route::get('/flaged-resources/pajax', 'UserController@flagedResourcesPAjax')->name('user.flagedResources.list.pajax');
	Route::prefix('flaged-resource')->group(function(){
		Route::get('/notice/{id}', 'UserController@flagedResourceNotice')->name('user.flagedResource.notice');
		Route::get('/del/{id}', 'UserController@delFlagedResource')->name('user.delFlagedResource');
		Route::get('/rem-flag/{id}', 'UserController@remFlagedResource')->name('user.remFlagedResource');
	});



	Route::get('/own/profile', 'UserController@ownProfile')->name('user.own.profile.form');


	Route::get('remove-following/{id}', 'UserController@remFollwing');

	Route::get('notifications', 'UserController@notifications')->name('user.all.notifications');

	Route::get('/download-history', 'UserController@downloadHistoryList')->name('user.download.history.list');

	Route::get('/download-history/del/{id}', 'UserController@downloadHistoryRemoveById');
	Route::get('/download-history/batch-del/{id}', 'UserController@downloadHistoryRemoveByBatch');


	Route::get('/viewing-history', 'UserController@viewingHistoryList')->name('user.viewing.history.list');

	Route::get('/viewing-history/del/{id}', 'UserController@viewingHistoryRemoveById');
	Route::get('/viewing-history/batch-del/{id}', 'UserController@viewingHistoryRemoveByBatch');

	Route::get('/saved-resource/del/{id}', 'UserController@delSavedResource')->name('user.view.savedResource.del');
	Route::get('/saved-resource', 'UserController@viewSavedResource')->name('user.view.savedResource.list');


	Route::get('/reported-user', 'UserController@viewReportedUsers')->name('user.view.reportedUsers.list');
	Route::get('/reported-user/pajax', 'UserController@viewReportedUsersPajax')->name('user.view.reportedUsers.list.pajax');
});

/* User Route End */


/* Maintenance route */
Route::get('shut/the/application/down', function()
{
    Artisan::call('down');
});

  Route::get('shut/the/application/up', function()
{
    Artisan::call('up');
});

Route::get('/cache',function(){
	\Artisan::call('config:clear');
	\Artisan::call('cache:clear');
	\Artisan::call('view:clear');
	dd('cleared');
});
/* Maintenance route end*/

Route::get('/', 'ThemeController@index')->name('theme.index');