<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Events\ResourceBanEvent;
use App\Events\AdminUserContactEvent;
use App\Resource;
use App\Donation;
use App\Option;
use App\ResourceDownload;
use App\ResourceCategory;
use App\UserRourceVisit;
use App\ResourceFlag;
use App\ResourceLike;
use App\ResourceTag;
use App\ResourceReview;
use App\Subscriber;
use App\Setting;
use App\Tag;
use App\User;
use App\Notice;
use App\MailSetting;
use App\RoleUser;
use App\Testimonial;
use App\Http\Requests\CreateUserRequest;
use App\Page;
use App\FAQMain;
use App\FAQSub;
use DB;
use Illuminate\Support\Carbon;
use App\Visitor;
use App\UserNotification;
use Auth;
use Session;
use Hash;

class AdminController extends Controller
{


    public function index(Request $request){
    	$users = DB::table('users')->join('role_user', 'users.id', '=', 'role_user.user_id')->where('role_user.role_id', '!=', '1')->select('users.*')->get();

    	$donations = DB::table('donations')->get();
    	
    	$resources = DB::table('resources')->orderBy('id', 'ASC')->get();

        $resourceDownload = ResourceDownload::where('created_at', '>', Carbon::now()->subDays(30))->get();
    	$subscribers = Subscriber::where('created_at', '>', Carbon::now()->subDays(30))->get();
    	$visitors = Visitor::where('created_at', '>', Carbon::now()->subDays(30))->get();

        $admins = DB::table('users')->join('role_user', 'users.id', '=', 'role_user.user_id')->where('role_user.role_id', '=', '1')->select('users.*')->get();

        $moderators = DB::table('users')->join('role_user', 'users.id', '=', 'role_user.user_id')->where('role_user.role_id', '=', '3')->select('users.*')->get();

        $verifiedUsers = DB::table('users')->join('role_user', 'users.id', '=', 'role_user.user_id')->where('users.validate', '=', '1')->select('users.*')->get();

        $userNotifications = UserNotification::where('user_id', Auth::user()->id)->where('status', '=', '0')->get();



        $downloadHistory = DB::select("SELECT resources.*, resd.id AS dhid, resd.created_at AS ddate FROM resources INNER JOIN (SELECT * FROM resource_download WHERE user_id = " . Auth::user()->id . " GROUP BY resource_download.resource_id ORDER BY resource_download.created_at DESC) AS resd ON resources.id = resd.resource_id");

        $userResourceVisit = DB::select("SELECT resources.*, resv.id AS rvid, resv.created_at AS ddate FROM resources INNER JOIN (SELECT * FROM user_resource_visit WHERE user_id = " . Auth::user()->id . " GROUP BY user_resource_visit.resource_id ORDER BY user_resource_visit.created_at DESC) AS resv ON resources.id = resv.resource_id");


        $savedResource = [];
        if (!blank(Auth::user()->saved_resources)) {
            $savedResArray = explode(",", Auth::user()->saved_resources);
            $savedResource = DB::select("SELECT resources.* FROM resources WHERE resources.id IN (" . Auth::user()->saved_resources .")");
        }


        $pendingResource = DB::table('resources')->leftJoin('users', 'resources.user_id', '=', 'users.id')->select('resources.*', 'users.username', 'users.profile_picture')->where('resources.resource_status', 'pending', DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"))->orderBy('id', 'ASC')->get();



        $myResources = DB::table('resources')
                    ->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews_count', 'res_view_count.stars')
                    ->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')
                    ->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')
                    ->where('resources.user_id', "=", Auth::user()->id)
                    ->get();


        $flagedResources = DB::table('resource_flags')->select('resource_flags.resource_id as id','resource_flags.user_id AS flagsBy','resource_flags.reason', 'resource_flags.status', 'resources.title', 'resources.block', 'usr1.username AS uploader', 'usr.username AS flagsUsername', "resources.preview_attachment", "resources.created_at")
                ->join('resources', 'resource_flags.resource_id', '=', 'resources.id')
                ->leftJoin('users', 'resource_flags.user_id', '=', 'users.id')
                ->leftJoin('users as usr', 'resource_flags.user_id', '=', 'usr.id')
                ->leftJoin('users as usr1', 'resources.user_id', '=', 'usr1.id')
                ->leftJoin('resources as rs', 'rs.user_id', '=', 'users.id')
                ->where('resource_flags.status', '=', 'pending')
                ->groupBy('resource_flags.resource_id')->get();

        $followingText = Auth::user()->following;
        $following = [];
        if (!blank($followingText)) {
            $following = User::whereIn('id', explode(",", $followingText))->get();
        }



        $followerText = Auth::user()->followers;
        $followers = [];
        if (!blank($followerText)) {
            $followers = User::whereIn('id', explode(",", $followerText))->get();
        }


        $reportedUsers = DB::table('users')
                            ->select('users.*', 'roles.name as role_name', 'notices_view.total_notice AS notice')
                            ->Join('notices_view', 'users.id', '=', 'notices_view.user_id')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id')->get();

        return view('dashboard.index', [
    									'users' => $users,
    									'donations' => $donations,
    									'resources' => $resources,
    									'resourceDownload' => $resourceDownload,
    									'subscribers' => $subscribers,
    									'visitors' => $visitors,
                                        'admins' => $admins,
                                        'moderators' => $moderators,
                                        'verifiedUsers' => $verifiedUsers,
                                        'userNotifications' => $userNotifications,
                                        'downloadHistory' => $downloadHistory,
                                        'myResources' => $myResources,
                                        'userResourceVisit' => $userResourceVisit,
                                        'savedResource' => $savedResource,
                                        'pendingResource' => $pendingResource,
                                        'flagedResources' => $flagedResources,
                                        'following' => $following,
                                        'follower' => $followers,
                                        'reportedUsers' => $reportedUsers,
    								]);
    }



    /* Resources Area Start */
    /* Resources List === admin.resources.list */
    
    public function publishedResources(Request $request){
    	
        $allInputs = $request->all();
    	$resourcesObj = DB::table('resources')->leftJoin('users', 'resources.user_id', '=', 'users.id')->select('resources.*', 'users.username', 'users.profile_picture', DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"))->where('resources.resource_status', 'published');

    	if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $resourcesObj = $resourcesObj->where(function($q) use($allInputs){$q->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"));});
        }

        $resources = $resourcesObj->orderBy('id', 'ASC')->paginate(30)->withPath('published-resources/pajax');

    	$likes = null;
    	if(!blank(collect($resources->toArray()['data'])->pluck('id')->toArray())){
    		$likes = DB::table('resource_likes')->whereIn('resource_id', collect($resources->toArray()['data'])->pluck('id')->toArray())->select(DB::raw("COUNT(resource_likes.id) AS likes"), 'resource_id')->groupBy('resource_id')->get()->toArray();
    		$_likes = [];
    		if(!blank($likes)){
    			foreach ($likes as $key) {
    				$_likes[$key->resource_id] = $key->likes;
    			}
    		}
    		$likes = $_likes;
    	}

    	
    	
    	return view('dashboard.admin.resources.admin_published_resource_list', [
    								'resources' => $resources,
    								'likes' => $likes,
                                    'allInputs' => $allInputs
    							]);
    }



    public function publishedResourcesPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();
            $resourcesObj = DB::table('resources')->leftJoin('users', 'resources.user_id', '=', 'users.id')->select('resources.*', 'users.username', 'users.profile_picture', DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"))->where('resources.resource_status', 'published');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $resourcesObj = $resourcesObj->where(function($q) use($allInputs){$q->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"));});
            }

            $resources = $resourcesObj->orderBy('id', 'ASC')->paginate(30)->withPath('published-resources/pajax');

            $likes = null;
            if(!blank(collect($resources->toArray()['data'])->pluck('id')->toArray())){
                $likes = DB::table('resource_likes')->whereIn('resource_id', collect($resources->toArray()['data'])->pluck('id')->toArray())->select(DB::raw("COUNT(resource_likes.id) AS likes"), 'resource_id')->groupBy('resource_id')->get()->toArray();
                $_likes = [];
                if(!blank($likes)){
                    foreach ($likes as $key) {
                        $_likes[$key->resource_id] = $key->likes;
                    }
                }
                $likes = $_likes;
            }

            
            
            return view('dashboard.admin.resources.published_resource_pagination', [
                                        'resources' => $resources,
                                        'likes' => $likes,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }


    public function delPublishedResource(Request $request)
    {
    	Resource::where('id', $request->id)->first()->delete();
    	return response()->json(['success' => '1'], 200);
    }
    

    public function banPublishedResource(Request $request)
    {
    	$prev = null;
    	$resource = Resource::find($request->id);
    	$prev = $resource->block;
    	$resource->block = $resource->block == '1' ? '0' : '1';
    	$resource->save();
    	$inputs = $request->all();
    	if (!isset($inputs['unban'])) {
    		$mailData = null;
    		if(blank($inputs['message'])){
    			$mailData = [
    						'message' => MailSetting::getSettings('ban_mail'), 
    						'user' => $resource->user,
    						'resource' => $resource
    					];
    		}
    		else{
    			$mailData = [
    						'message' => (MailSetting::getSettings('ban_mail') .'<br>' . $inputs['message']), 
    						'user' => $resource->user,
    						'resource' => $resource
    					];
    		}
    		event(new ResourceBanEvent($mailData));
    	}
    	return response()->json(['success' => '1', 'prev' => $prev], 200);
    }

    public function featuredPublishedResource(Request $request)
    {
    	$prev = null;
    	$resource = Resource::find($request->id);
    	$prev = $resource->isFeatured;
    	$resource->isFeatured = $resource->isFeatured == '1' ? '0' : '1';
    	$resource->save();
    	return response()->json(['success' => '1', 'prev' => $prev], 200);
    }



    /* Pending resource start */



    public function pendingResources(Request $request)
    {
        $allInputs = $request->all();
        $resourcesObj = DB::table('resources')->leftJoin('users', 'resources.user_id', '=', 'users.id')->select('resources.*', 'users.username', 'users.profile_picture')->where('resources.resource_status', 'pending', DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"));

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $resourcesObj = $resourcesObj->where(function($q) use($allInputs){$q->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"));});
        }

        $resources = $resourcesObj->orderBy('id', 'ASC')->paginate(30)->withPath('pending-resources/pajax');

        return view('dashboard.admin.resources.admin_pending_resource_list', [
                                    'resources' => $resources,
                                    'allInputs' => $allInputs
                                ]);
    }



    public function pendingResourcesPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();
            $resourcesObj = DB::table('resources')->leftJoin('users', 'resources.user_id', '=', 'users.id')->select('resources.*', 'users.username', 'users.profile_picture', DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"))->where('resources.resource_status', 'pending');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $resourcesObj = $resourcesObj->where(function($q) use($allInputs){$q->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"));});
            }

            $resources = $resourcesObj->orderBy('id', 'ASC')->paginate(30)->withPath('pending-resources/pajax');

            return view('dashboard.admin.resources.pending_resource_pagination', [
                                        'resources' => $resources,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }


    public function approvePendingResource(Request $request)
    {
        $resource = Resource::find($request->id);
        $resObj = $resource;
        $resource->resource_status = 'published';
        $resource->approved_by = Auth::user()->id;
        $resource->save();
        UserNotification::create([
                'user_id' => $resObj->user_id,
                'message' => ('Your resource has been approved <a href="/resource/' . $resObj->id . '">link</a>.'),
                'status' => '0'
            ]);
        $user = User::where('id', $resObj->user_id)->first();
        $userFollowers = $user->followers;
        if (!blank($userFollowers)) {
            $userFollowersArray = explode(",", $userFollowers);
            foreach ($userFollowersArray as $key => $value) {
                UserNotification::create([
                    'user_id' => $value,
                    'message' => ('New resource has been uploaded by ' . $user->username . ' <a href="/resource/' . $resObj->id . '">link</a>.'),
                    'status' => '0'
                ]);
            }
        }
        return response()->json(['success' => '1', 'data' => 'Resource published!'], 200);
    }

    /* Resources Area End */



    /* Subscribers Area Start */
    
    public function subscribers(Request $request)
    {
        $allInputs = $request->all();

        $subscribersObj = DB::table('subscribers')->select('subscribers.*');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $subscribersObj = $subscribersObj->where('subscribers.email', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $subscribers = $subscribersObj->orderBy('id', 'ASC')->paginate(30)->withPath('subscribers/pajax');

        return view('dashboard.admin.subscribers.admin_subscribers_list', [
                                    'subscribers' => $subscribers,
                                    'allInputs' => $allInputs
                                ]);
    }


    public function subscribersPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();

            $subscribersObj = DB::table('subscribers')->select('subscribers.*');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $subscribersObj = $subscribersObj->where('subscribers.email', 'like', ("%" . $allInputs['query'] . "%"));
            }

            $subscribers = $subscribersObj->orderBy('id', 'ASC')->paginate(30)->withPath('subscribers/pajax');

            return view('dashboard.admin.subscribers.subscriber_pagination', [
                                        'subscribers' => $subscribers,
                                        'allInputs' => $allInputs
                                    ])->render();
            
        }
    }

    public function delSubscriber(Request $request)
    {
        Subscriber::where('id', $request->id)->first()->delete();
        return response()->json(['success' => '1'], 200);
    }




    public function banSubscriber(Request $request)
    {
        $prev = null;
        $subscriber = Subscriber::find($request->id);
        $prev = $subscriber->status;
        $subscriber->status = $subscriber->status == '1' ? '0' : '1';
        $subscriber->save();
        return response()->json(['success' => '1', 'prev' => $prev], 200);
    }


    /* Subscribers Area End */


    /* Donation Area Start */


    public function donations(Request $request)
    {
        $allInputs = $request->all();
        $donationsObj = DB::table('donations')->select('donations.*');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $donationsObj = $donationsObj
                        ->where('donations.email', 'like', ("%" . $allInputs['query'] . "%"))
                        ->orWhere('donations.fname', 'like', ("%" . $allInputs['query'] . "%"))
                        ->orWhere('donations.lname', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $donations = $donationsObj->orderBy('id', 'ASC')->paginate(30)->withPath('donations/pajax');
        
        
        return view('dashboard.admin.donations.donations_list', [
                                    'donations' => $donations,
                                    'allInputs' => $allInputs
                                ]);
    }


    public function donationsPAjax(Request $request)
    {
        if($request->ajax()){
            $allInputs = $request->all();
            $donationsObj = DB::table('donations')->select('donations.*');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $donationsObj = $donationsObj
                            ->where('donations.email', 'like', ("%" . $allInputs['query'] . "%"))
                            ->orWhere('donations.fname', 'like', ("%" . $allInputs['query'] . "%"))
                            ->orWhere('donations.lname', 'like', ("%" . $allInputs['query'] . "%"));
            }

            $donations = $donationsObj->orderBy('id', 'ASC')->paginate(30)->withPath('donations/pajax');
            
            
            return view('dashboard.admin.donations.donation_pagination', [
                                        'donations' => $donations,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }


    /* Donation Area End */




    /* Users Area Start */


    public function users(Request $request)
    {
        $allInputs = $request->all();
        $usersObj = DB::table('users')
                            ->select('users.*', 'roles.name as role_name', 'notices_view.total_notice AS notice')
                            ->leftJoin('notices_view', 'users.id', '=', 'notices_view.user_id')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath('users/pajax');

        return view('dashboard.admin.users.users_list', [
                                    'users' => $users,
                                    'allInputs' => $allInputs
                                ]);
    }



    public function usersPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();

            $usersObj = DB::table('users')
                            ->select('users.*', 'roles.name as role_name', 'notices_view.total_notice AS notice')
                            ->leftJoin('notices_view', 'users.id', '=', 'notices_view.user_id')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
            }

            $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath('users/pajax');

            return view('dashboard.admin.users.user_pagination', [
                                        'users' => $users,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }


    public function userContact(Request $request)
    {
        $mailData = ['user' => User::find($request->id), 'message' => $request->message];
        event(new AdminUserContactEvent($mailData));
        return response()->json(['success' => '1'], 200);
    }



    public function userBlock(Request $request)
    {
        $prev = null;
        $user = User::find($request->id);
        $prev = $user->block;
        $user->block = $user->block == '1' ? '0' : '1';
        $user->save();
        $inputs = $request->all();
        return response()->json(['success' => '1', 'prev' => $prev], 200);
    }


    public function userDelete(Request $request)
    {
        $user = User::where('id', $request->id)->first();
        $user->roles()->detach();
        $user->delete();
        return response()->json(['success' => '1'], 200);
    }


    public function userNotice(Request $request)
    {
        Notice::create([
                            'user_id' => $request->id, 
                            'message' => '', 
                            'status' => '0'
                        ]);
        return response()->json(['success' => '1'], 200);
    }


    /*  Users Area End  */



    /* Flaged Resources Start  */


    public function flagedResources(Request $request)
    {
        $allInputs = $request->all();

        $flagedResourcesObj = DB::table('resource_flags')->select('resource_flags.resource_id as id','resource_flags.user_id AS flagsBy','resource_flags.reason', 'resource_flags.status', 'resources.title', 'resources.user_id AS uploaderid', 'resources.block', 'usr1.username AS uploader', 'usr.username AS flagsUsername', "resources.preview_attachment")
                ->join('resources', 'resource_flags.resource_id', '=', 'resources.id')
                ->leftJoin('users', 'resource_flags.user_id', '=', 'users.id')
                ->leftJoin('users as usr', 'resource_flags.user_id', '=', 'usr.id')
                ->leftJoin('users as usr1', 'resources.user_id', '=', 'usr1.id')
                ->leftJoin('resources as rs', 'rs.user_id', '=', 'users.id')
                ->where('resource_flags.status', '=', 'pending')
                ->groupBy('resource_flags.resource_id');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $flagedResourcesObj = $flagedResourcesObj->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $flagedResources = $flagedResourcesObj->paginate(30)->withPath('flaged-resources/pajax');
        
        return view('dashboard.admin.resources.flag_resource', [
                                        'flagedResources' => $flagedResources,
                                        'allInputs' => $allInputs
                                    ]);
    }


    public function flagedResourcesPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();

        $flagedResourcesObj = DB::table('resource_flags')->select('resource_flags.resource_id as id','resource_flags.user_id AS flagsBy','resource_flags.reason', 'resource_flags.status', 'resources.title', 'resources.block', 'usr1.username AS uploader', 'usr.username AS flagsUsername', "resources.preview_attachment")
                ->join('resources', 'resource_flags.resource_id', '=', 'resources.id')
                ->leftJoin('users', 'resource_flags.user_id', '=', 'users.id')
                ->leftJoin('users as usr', 'resource_flags.user_id', '=', 'usr.id')
                ->leftJoin('users as usr1', 'resources.user_id', '=', 'usr1.id')
                ->leftJoin('resources as rs', 'rs.user_id', '=', 'users.id')
                ->where('resource_flags.status', '=', 'pending')
                ->groupBy('resource_flags.resource_id');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $flagedResourcesObj = $flagedResourcesObj->where('resources.title', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('resources.description', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $flagedResources = $flagedResourcesObj->paginate(30)->withPath('flaged-resources/pajax');
        
        return view('dashboard.admin.resources.flag_resource_pagination', [
                                        'flagedResources' => $flagedResources,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }


    public function flagedResourceNotice(Request $request)
    {
        $user_id = Resource::find($request->id)->user_id;
        Notice::create([
                            'user_id' => $user_id, 
                            'message' => '', 
                            'status' => '0'
                        ]);
        return response()->json(['success' => '1'], 200);
    }


    public function delFlagedResource(Request $request)
    {
        Resource::where('id', $request->id)->first()->delete();
        return response()->json(['success' => '1'], 200);
    }


    public function remFlagedResource(Request $request)
    {
        //ResourceFlag::where('id', $request->id)->first()->delete();
        DB::delete('DELETE FROM resource_flags WHERE resource_id = ' . $request->id);
        return response()->json(['success' => '1'], 200);
    }


    /* Flaged Resources End  */


    /* Static Page Start */

    public function editPrivacyPolicy(Request $request)
    {
        $privacy = Page::where('name', 'privacy')->first();
        return view('dashboard.admin.static.privacy', ['privacy' => $privacy]);
    }


    public function savePrivacyPolicy(Request $request)
    {
        $privacy = Page::where('name', 'privacy')->first();
        $privacy->content = $request->content;
        $privacy->save();
        Session::flash('message', "Privacy policy content saved!");
        return redirect()->back();
    }


    public function editTerms(Request $request)
    {
        $terms = Page::where('name', 'terms')->first();
        return view('dashboard.admin.static.terms', ['terms' => $terms]);
    }


    public function saveTerms(Request $request)
    {
        $terms = Page::where('name', 'terms')->first();
        $terms->content = $request->content;
        $terms->save();
        Session::flash('message', "Terms & Conditions content saved!");
        return redirect()->back();
    }

    /* Static Page End */


    /* Own Section Start */

    public function ownProfile(Request $request)
    {
        $countries = DB::table('countries')->get();
        return view('dashboard.users.profile.profile', ['countries' => $countries]);
    }



    public function myResources(Request $request)
    {
        $allInputs = $request->all();
        $resources = DB::table('resources')
                    ->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews_count', 'res_view_count.stars')
                    ->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')
                    ->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')
                    ->where('resources.user_id', "=", Auth::user()->id)
                    ->paginate(10)->withPath('my-resources/pajax');
        
        
        return view('dashboard.admin.resources.my_resources', ['resources' => $resources, 'allInputs' => $allInputs]);
    }


    public function myResourcesPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allParam = $request->all();
            
            $resourcesObj = DB::table('resources')
                    ->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews_count', 'res_view_count.stars')
                    ->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')
                    ->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')
                    ->where('resources.user_id', "=", Auth::user()->id);

            if (isset($allParam['query']) && !blank($allParam['query'])){
                $resourcesObj = $resourcesObj->where(function($q) use($allParam){$q->where('resources.title', 'like', ("%" . $allParam['query'] . "%"))->orWhere('resources.description', 'like', ("%" . $allParam['query'] . "%"));});
            }
            $resources = $resourcesObj->paginate(10)->withPath('my-resources/pajax');
        
        
        return view('dashboard.admin.resources.my_resources_pagination', ['resources' => $resources, 'allInputs' => $allParam])->render();
        }
    }


    public function delMyResources(Request $request)
    {
        Resource::where('id', $request->id)->first()->delete();
        return response()->json(['success' => '1'], 200);
    }




    public function testimonials(Request $request)
    {
        $testimonials = Testimonial::paginate(30)->withPath('testimonials/pajax');
        return view('dashboard.admin.static.testimonials_list', ['testimonials' => $testimonials]);
    }


    public function testimonialsPAjax(Request $request)
    {
        if ($request->ajax()) {
            $testimonials = Testimonial::paginate(30)->withPath('testimonials/pajax');
        return view('dashboard.admin.static.testimonials_pagination', ['testimonials' => $testimonials])->render();
        }
    }


    public function delTestimonials(Request $request)
    {
        Testimonial::where('id', $request->id)->first()->delete();
        return response()->json(['success' => '1'], 200);
    }


    public function editTestimonials(Request $request)
    {
        $testimonial = Testimonial::find($request->id);
        return response()->json(['success' => '1', 'data' => $testimonial], 200);
    }


    public function updateTestimonials(Request $request)
    { 
        $testimonial = Testimonial::where('id', $request->id)->first();
        $testimonial->testimonial_text = $request->message;
        $testimonial->testimonial_by = $request->testimonial_by;
        $testimonial->save();
        return response()->json(['success' => '1'], 200);
    }


    public function createTestimonials(Request $request)
    {
        Testimonial::create(['testimonial_by' => $request->testimonial_by, 'testimonial_text' => $request->message]);
        return response()->json(['success' => '2'], 200);
    }


    public function createUser(CreateUserRequest $request)
    {
        $user = User::create([
                                'first_name' => $request->first_name,
                                'last_name' => $request->last_name,
                                'email' => $request->email,
                                'username' => $request->username,
                                'password' => Hash::make($request->password),    
                            ]);

        RoleUser::create(['role_id' => '2', 'user_id' => $user->id]);

        return response()->json(['success' => '1'], 200);
    }



    public function headerImageList(Request $request)
    {
        $headerImages = Option::where('name', 'like', '%HEADER_IMG%')->get();
        return view('dashboard.admin.static.header_images_list', ['headerImages' => $headerImages]);
    }


    public function headerImageUpload(Request $request)
    {
        $allInputs = $request->all();
        if (isset($allInputs['image'])) {
            $imageObj = Option::where('name', $allInputs['img_key'])->first();
            $file = $request->file('image');
            $fileName = $allInputs['img_key'] . '.' . $file->getClientOriginalExtension();
            $destinationPath = 'irh_assets/images/';
            $file->move($destinationPath,$fileName);
            $imageObj->value = $fileName;
            $imageObj->save();
            Session::flash('success', 'Image uploaded!');
        }

        return redirect()->back();
    }

    public function tagsCategories()
    {
        $tags = Tag::all();
        $resourceCategories = ResourceCategory::all();
        return view('dashboard.admin.static.tag_categories', [
                            'tags' => $tags, 
                            'resourceCategories' => $resourceCategories]);
    }


    public function tagsCategoriesDel(Request $request)
    {
        if ($request->ct == 'c') {
            $resources = Resource::where('category_id', $request->id)->get()->toArray();
            if (count($resources)) {
                return response()->json(['errors' => ['err' => 'Unable to complete the job!']], 500);
            }
            else{
                ResourceCategory::where('id', $request->id)->delete();
                return response()->json(['success' => '1', 'message' => 'Category deleted!'], 200);
            }
        }
        elseif($request->ct == 't'){
            $resources = Resource::whereIn('id', ResourceTag::where('tag_id', $request->id)->groupBy('resource_id')->get()->pluck('resource_id')->toArray())->get()->pluck('id')->toArray();
            if (count($resources)) {
                return response()->json(['errors' => ['err' => 'Unable to complete the job!']], 500);
            }
            else{
                Tag::where('id', $request->id)->delete();
                return response()->json(['success' => '1', 'message' => 'Tag deleted!'], 200);
            }
        }
    }


    public function tagsCategoriesSave(Request $request)
    {
        $allInputs = $request->all();
        if (array_key_exists('tag_id', $allInputs)) {
            if (!blank($allInputs['tag_id'])) {
                $tag = Tag::where('id', $allInputs['tag_id'])->first();
                $tag->tag_group = $allInputs['tag_group'];
                $tag->name = $allInputs['tag_name'];
                $tag->save();
                Session::flash('success', 'Tag updated!');
            }
            else{
                Tag::create(['tag_group' => $allInputs['tag_group'], 'name' => $allInputs['tag_name']]);
                Session::flash('success', 'Tag created!');
            }
        }
        else{
            if (!blank($allInputs['category_id'])) {
                $resourceCategory = ResourceCategory::where('id', $allInputs['category_id'])->first();
                $resourceCategory->title = $allInputs['category'];
                $resourceCategory->save();
                Session::flash('success', 'Category updated!');
            }
            else{
                ResourceCategory::create(['title' => $allInputs['category']]);
                Session::flash('success', 'Category created!');
            }
        }

        return redirect()->back();
    }




    public function faqsList(Request $request)
    {
        $faq_main = FAQMain::all();
        return view('dashboard.admin.static.faqs_list', ['faq_main' => $faq_main]);
    }


    public function faqsUpdate(Request $request)
    {
        $allInputs = $request->all();
        $FAQMainId = "";
        if (array_key_exists('faq_group_id', $allInputs)) {
            if (!blank($allInputs['faq_group_id'])) {
                $FAQMainId = $allInputs['faq_group_id'];
                $tag = FAQMain::where('id', $allInputs['faq_group_id'])->first();
                $tag->name = $allInputs['faq_group'];
                $tag->save();
                Session::flash('success', 'Faq group updated!');
            }
            else{
                $faqObj = FAQMain::create(['name' => $allInputs['faq_group']]);
                $FAQMainId = $faqObj->id;
                Session::flash('success', 'Faq group created!');
            }
        }
        else{
            if (!blank($allInputs['faq_sub_id'])) {
                $FAQMainId = $allInputs['faq_main_group'];
                $faqSubObj = FAQSub::where('id', $allInputs['faq_sub_id'])->first();
                $faqSubObj->faq_main_id = $allInputs['faq_main_group'];
                $faqSubObj->name = $allInputs['faq_sub_header'];
                $faqSubObj->value = $allInputs['faq_sub_header_ans'];
                $faqSubObj->save();
                Session::flash('success', 'Faq question updated!');
            }
            else{
                $FAQMainId = $allInputs['faq_main_group'];
                FAQSub::create(['faq_main_id' => $allInputs['faq_main_group'], 'name' => $allInputs['faq_sub_header'], 'value' => $allInputs['faq_sub_header_ans']]);
                Session::flash('success', 'Faq question created!');
            }
        }

        return redirect()->back()->with('FAQMainId', $FAQMainId);
    }


    public function getQuestions(Request $request)
    {
        $faqSubObj = FAQSub::where('faq_main_id', $request->id)->get();
        return view('dashboard.admin.static.faq_questions_list', ['faqSubObj' => $faqSubObj])->render();
    }



    public function delQuestions(Request $request)
    {
        FAQSub::find($request->id)->delete();
        return response()->json(['success' => '1', 'message' => 'Question deleted!'], 200);
    }



    public function getUsersTypeList(Request $request)
    {

        $allInputs = $request->all();
        $userType = "";
        if (isset($request->type)) {
            
            if ($request->type == 'moderator') {

                $userType = '3';
            }
            elseif($request->type == 'user'){
                $userType = '2';
            }
            elseif($request->type == 'admin'){
                $userType = '1';
            }
            elseif($request->type == 'unverified_user'){
                $userType = '2';
            }
        }
        
        $usersObj = DB::table('users')
                            ->select('users.*', 'roles.name as role_name')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id')
                            ->where('role_user.role_id', '=', $userType);

        /*if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
        }*/

        if ($request->type == 'unverified_user') {
            $usersObj = $usersObj->where('users.validate' , '=', '0');
        }

        $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath($request->type . '/pajax');
        return view('dashboard.admin.users.users_list_external', [
                                    'users' => $users,
                                    'allInputs' => $allInputs,
                                    'type' => ucwords(str_replace('_', ' ', $request->type)),
                                    'r_type' => $request->type
                                ]);
    }


    public function getUsersTypeListPAjax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();
            $userType = "";
            if (isset($request->type)) {
                if ($request->type == 'moderator') {
                    $userType = '3';
                }
                elseif($request->type == 'user'){
                    $userType = '2';
                }
                elseif($request->type == 'admin'){
                    $userType = '1';
                }
                elseif($request->type == 'unverified_user'){
                    $userType = '2';
                }
            }
            $usersObj = DB::table('users')
                                ->select('users.*', 'roles.name as role_name')
                                ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                                ->Join('roles', 'role_user.role_id', '=', 'roles.id')
                                ->where('role_user.role_id', '=', $userType);

            /*if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
            }*/

            if ($request->type == 'unverified_user') {
                $usersObj = $usersObj->where('users.validate' , '=', '0');
            }

            $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath($request->type . '/pajax');

            return view('dashboard.admin.users.user_pagination_external', [
                                        'users' => $users,
                                        'allInputs' => $allInputs,
                                        'type' => ucwords(str_replace('_', ' ', $request->type)),
                                        'r_type' => $request->type
                                    ])->render();
        }
    }



    public function testTest(Request $request)
    {
        return view('dashboard.admin.static.test');
    }



    public function remFollwing(Request $request)
    {
        $selfRow = User::where('id', Auth::user()->id)->first();
        $selfFollowing = explode(",", $selfRow->following);
        $indexCompleted = array_search($request->id, $selfFollowing);
        unset($selfFollowing[$indexCompleted]);
        $selfRow->following = implode(",", $selfFollowing);
        $selfRow->save();

        $userFollowerRow = User::where('id', $request->id)->first();
        $userFollower = explode(",", $userFollowerRow->followers);
        $indexCompleted = array_search(Auth::user()->id, $userFollower);
        unset($userFollower[$indexCompleted]);
        $userFollowerRow->followers = implode(",", $userFollower);
        $userFollowerRow->save();


        return response()->json(['success' => '1'], 200);
    }


    public function userVerify(Request $request)
    {
        $user = User::where('id', $request->id)->first();
        $user->validate = '1';
        $user->save();
        return response()->json(['success' => '1'], 200);
    }


    public function userSetModarator(Request $request)
    {
        if (Auth::user()->id == $request->id) {
            return response()->json(['errors' => ['message' => 'Unable to complete the job!']], 500);
        }
        else{
            $role_user = RoleUser::where('user_id', $request->id)->first();
            $role_user->role_id = '3';
            $role_user->save();
            return response()->json(['success' => '1'], 200);
        }
    }


    public function userSetadmin(Request $request)
    {
         if (Auth::user()->id == $request->id) {
            return response()->json(['errors' => ['message' => 'Unable to complete the job!']], 500);
        }
        else{
            $role_user = RoleUser::where('user_id', $request->id)->first();
            $role_user->role_id = '1';
            $role_user->save();
            return response()->json(['success' => '1'], 200);
        }
    }


    public function userUnSetModarator(Request $request)
    {
         if (Auth::user()->id == $request->id) {
            return response()->json(['errors' => ['message' => 'Unable to complete the job!']], 500);
        }
        else{
            $role_user = RoleUser::where('user_id', $request->id)->first();
            $role_user->role_id = '2';
            $role_user->save();
            return response()->json(['success' => '1'], 200);
        }
    }

    public function userUnSetadmin(Request $request)
    {
         if (Auth::user()->id == $request->id) {
            return response()->json(['errors' => ['message' => 'Unable to complete the job!']], 500);
        }
        else{
            $role_user = RoleUser::where('user_id', $request->id)->first();
            $role_user->role_id = '3';
            $role_user->save();
            return response()->json(['success' => '1'], 200);
        }
    }


    public function notifications(Request $request)
    {
        $notifications = UserNotification::where('user_id', Auth::user()->id)->where('status', '0')->get();
        DB::update('UPDATE notifications SET status = 1 WHERE user_id = ' . Auth::user()->id);
        return view('dashboard.admin.static.notifications', ['notifications' => $notifications]);
    }




    public function downloadHistoryList(Request $request)
    {
        $downloadHistory = DB::table('resource_download')->leftJoin('resources', 'resource_download.resource_id', '=', 'resources.id')->where('resource_download.user_id', '=', Auth::user()->id)->select('resources.preview_attachment', 'resource_download.*')->orderBy('resource_download.id', 'DESC')->get();

        
        return view('dashboard.admin.static.download_history_list', ['downloadHistory' => $downloadHistory]);
    }


    public function downloadHistoryRemoveById(Request $request)
    {
        ResourceDownload::where('id', $request->id)->where('user_id', Auth::user()->id)->first()->delete();
        return response()->json(['success' => '1'], 200); 
    }


    public function downloadHistoryRemoveByBatch(Request $request)
    {
        if ($request->id == '1') {
            DB::delete('DELETE FROM resource_download WHERE created_at >= DATE_SUB(now(),interval 1 hour) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM resource_download WHERE created_at >= DATE_SUB(now(),interval 1 DAY) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM resource_download WHERE created_at >= DATE_SUB(now(),interval 7 DAY) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM resource_download WHERE created_at >= DATE_SUB(now(),interval 28 DAY) AND user_id = ' . Auth::user()->id);
        }
        else{
            DB::delete('DELETE FROM resource_download WHERE user_id = ' . Auth::user()->id);
        }
        return response()->json(['success' => '1'], 200); 
    }


    public function viewingHistoryList(Request $request)
    {
        $viewingHistory = DB::table('user_resource_visit')->leftJoin('resources', 'user_resource_visit.resource_id', '=', 'resources.id')->select('resources.preview_attachment', 'user_resource_visit.*')->orderBy('user_resource_visit.id', 'DESC')->get();

        
        return view('dashboard.admin.static.viewing_history_list', ['viewingHistory' => $viewingHistory]);
    }


    public function viewingHistoryRemoveById(Request $request)
    {
        UserRourceVisit::where('id', $request->id)->first()->delete();
        return response()->json(['success' => '1'], 200); 
    }


    public function viewingHistoryRemoveByBatch(Request $request)
    {
        if ($request->id == '1') {
            DB::delete('DELETE FROM user_resource_visit WHERE created_at >= DATE_SUB(now(),interval 1 hour) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM user_resource_visit WHERE created_at >= DATE_SUB(now(),interval 1 DAY) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM user_resource_visit WHERE created_at >= DATE_SUB(now(),interval 7 DAY) AND user_id = ' . Auth::user()->id);
        }
        elseif($request->id == '2'){
            DB::delete('DELETE FROM user_resource_visit WHERE created_at >= DATE_SUB(now(),interval 28 DAY) AND user_id = ' . Auth::user()->id);
        }
        else{
            DB::delete('DELETE FROM user_resource_visit WHERE user_id = ' . Auth::user()->id);
        }
        return response()->json(['success' => '1'], 200); 
    }



    public function viewSavedResource(Request $request)
    {
        $allParam = $request->all();
        $resources = null;

        $saved_resource_text = Auth::user()->saved_resources;
        if (blank($saved_resource_text)) {
             $filters = Tag::all();
            return view('dashboard.admin.static.saved_resource',[
                                    'resources' => [],
                                    'allParam' => [],
                                    'filters' => $filters]);
        } 
        else{
            $saved_resource_array = explode(",", $saved_resource_text);

            if (isset($allParam['search']) && !blank($allParam['search'])) {
                $resources = DB::table('resources')
                        ->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews')
                        ->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')
                        ->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')
                        ->whereIn('resources.id', $saved_resource_array)
                        ->where(function($q) use($allParam){$q->where('resources.title', 'like', ("%" . $allParam['search'] . "%"))->orWhere('resources.description', 'like', ("%" . $allParam['search'] . "%"));})
                        ->paginate(10);

            }
            elseif(isset($allParam['sort']) && !blank($allParam['sort'])){

                $searchArray = [];

                if (isset($allParam['res']) || isset($allParam['age'])) {
                    if (isset($allParam['res']) && !blank($allParam['res'])) {
                        array_push($searchArray, $allParam['res']);
                    }

                    if (isset($allParam['age']) && !blank($allParam['age'])) {
                        array_push($searchArray, $allParam['age']);
                    }
                }
                //$searchArray = implode(",", $searchArray);

                $sortBy = "";
                if ($allParam['sort'] == "relevance") {
                    $sortBy = ['id', 'ASC'];
                }
                elseif($allParam['sort'] == "newest") {
                    $sortBy = ['created_at', 'ASC'];
                }
                elseif($allParam['sort'] == "mdl") {
                    $sortBy = ["downloads", "DESC"];
                }
                elseif($allParam['sort'] == "hr") {
                    $sortBy = ["rate", "DESC"];
                }

                $resources = DB::table('resources')->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews', 'res_view_count.stars AS rate')
                    ->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')
                    ->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')
                    ->whereIn('resources.id', $saved_resource_array)
                    ->when(!blank($searchArray), function ($q) use($searchArray){
                        return $q->whereIn('resources.id', DB::table('resource_tag')->select("resource_id")->whereIn('tag_id', $searchArray)->groupBy('resource_id')->get()->pluck('resource_id')->toArray());
                    })->orderBy($sortBy[0], $sortBy[1])->paginate(10);

            }
            else{
                $resources = DB::table('resources')->select(DB::raw("IF(resources.preview_attachment = null, CONCAT('irh_assets/uploads/resource_preview/' , resources.preview_attachment),'irh_assets/images/dummypreview.png') prev"),'resources.*', 'res_like_count.res_likes AS likes', 'res_view_count.res_reviews AS reviews')->leftJoin('res_like_count', 'resources.id', '=', 'res_like_count.resource_id')->leftJoin('res_view_count', 'resources.id', '=', 'res_view_count.resource_id')->whereIn('resources.id', $saved_resource_array)->paginate(10);
            }
            $filters = Tag::all();
            return view('dashboard.admin.static.saved_resource',[
                                    'resources' => $resources,
                                    'allParam' => $allParam,
                                    'filters' => $filters]);
        }
    }



    public function createResources(Request $request)
    {
        $filters = Tag::all();
        $resourceCategory = ResourceCategory::all();
        return view('dashboard.admin.resources.edit_resource', [
                                'edit' => '0',
                                'filters' => $filters,
                                'resourceCategory' => $resourceCategory
                            ]);
    }



    public function saveResources(Request $request)
    {
        $allInputs = $request->all();
        if ($request->has('resid')) {
            if ($request->has('form_name')) {
                if ($allInputs['form_name'] == 'link0') {
                    $resource = Resource::where('id', $request->resid)->first();
                    $resource->title = $request->resource_title;
                    $resource->description = $request->description;
                    $resource->embed_link = $request->embed_url;
                    $resource->resource_status = 'draft';


                    if (isset($allInputs['resource_attachment'])) {
                        $file = $request->file('resource_attachment');
                        $fileName = $resource->user_id . '.' . $file->getClientOriginalExtension();
                        $destinationPath = 'irh_assets/uploads/resource_files';
                        $file->move($destinationPath,$fileName);
                        $resource->resource_attachment = $fileName;
                    }

                    if(isset($allInputs['preview_attachment'])){
                        $file = $request->file('preview_attachment');
                        $fileName = $resource->user_id . '.' . $file->getClientOriginalExtension();
                        $destinationPath = 'irh_assets/uploads/resource_preview';
                        $file->move($destinationPath,$fileName);
                        $resource->preview_attachment = $fileName;
                    }
                    elseif(isset($allInputs['preview_attachment_hidden']) && !blank($allInputs['preview_attachment_hidden'])){

                    }
                    elseif(isset($allInputs['generate_preview_attachment'])){
                        $resource->preview_attachment = 'dummypreview.png';
                    }
                    $resource->save();

                    $_resource = Resource::where('id', $request->resid)->first();
                    if (!blank($_resource->title) && !blank($_resource->description) && !blank($_resource->resource_attachment) && !blank($_resource->preview_attachment)) {
                        return response()->json(['success' => '1', 'addclass' => 'whitBack'], 200);
                    }
                    else{
                        return response()->json([
                            'success' => '1', 
                            ], 201);
                    }
                }
                elseif($allInputs['form_name'] == 'link1'){
                    $resource = Resource::where('id', $request->resid)->first();
                    $resource->category_id = $request->category_id;
                    $resource->save();

                    if(isset($allInputs['age_group']) && $allInputs['age_group']  && count($allInputs['age_group'])){
                        $tags = Tag::where('tag_group', 'Age Group')->get()->pluck('id')->toArray();
                        if (count($tags)) {
                            $tags = implode(",", $tags);
                            DB::delete('DELETE FROM resource_tag WHERE resource_id = ' . $request->resid . ' AND tag_id IN (' . $tags . ')');
                        }
                        foreach ($allInputs['age_group'] as $key => $value) {
                            ResourceTag::create([
                                                    'resource_id' => $request->resid,
                                                    'tag_id' => $value
                                                ]);
                        }
                    }

                    if(isset($allInputs['resource_type']) && $allInputs['resource_type']  && count($allInputs['resource_type'])){
                        $tags = Tag::where('tag_group', 'Resource Type')->get()->pluck('id')->toArray();
                        if (count($tags)) {
                            $tags = implode(",", $tags);
                            DB::delete('DELETE FROM resource_tag WHERE resource_id = ' . $request->resid . ' AND tag_id IN (' . $tags . ')');
                        }
                        foreach ($allInputs['resource_type'] as $key => $value) {
                            ResourceTag::create([
                                                    'resource_id' => $request->resid,
                                                    'tag_id' => $value
                                                ]);
                        }
                    }

                    if (isset($allInputs['age_group']) && $allInputs['age_group']  && count($allInputs['age_group']) && isset($allInputs['resource_type']) && $allInputs['resource_type']  && count($allInputs['resource_type'])) {
                        return response()->json(['success' => '1', 'addclass' => 'whitBack'], 200);
                    }
                    else{
                        return response()->json([
                            'success' => '1', 
                            ], 201);
                    }
                }
                elseif($allInputs['form_name'] == 'link2'){
                    if (isset($allInputs['licence']) && !blank($allInputs['licence'])) {
                        $resource = Resource::where('id', $request->resid)->first();
                        $resource->license_type = $request->licence;
                        $resource->save();
                        return response()->json(['success' => '1', 'addclass' => 'whitBack'], 200);
                    }
                    return response()->json(['success' => '1'], 201);
                }
                elseif($allInputs['form_name'] == 'link3'){
                    if ($request->has('terms')) {
                        $_resource = Resource::where('id', $request->resid)->first();

                        $_age_group = Tag::where('tag_group', 'Age Group')->get()->pluck('id')->toArray();
                        $_age_group = implode(",", $_age_group);
                        $_res_tag_age_group = DB::select('SELECT  tag_id FROM resource_tag WHERE resource_id = ' . $request->resid . ' AND tag_id IN (' . $_age_group . ')');


                        $_res_type = Tag::where('tag_group', 'Resource Type')->get()->pluck('id')->toArray();
                        $_res_type = implode(",", $_res_type);
                        $_res_tag_res_type = DB::select('SELECT tag_id FROM resource_tag WHERE resource_id = ' . $request->resid . ' AND tag_id IN (' . $_res_type . ')');

                        if (!blank($_resource->title) && !blank($_resource->description) && !blank($_resource->resource_attachment) && !blank($_resource->preview_attachment) && !blank($_resource->license_type) && !blank($_resource->category_id) && count($_res_tag_age_group) && count($_res_tag_res_type)) {
                            $_resource->resource_status = 'published';
                            $_resource->save();
                            return response()->json(['success' => '1', 'status' => 'Published', 'addclass' => 'whitBack'], 200);
                        }
                        else{
                            return response()->json(['success' => '1', 'pos' => '1'], 201);
                        }

                    }
                    return response()->json(['success' => '1'], 201);
                }
            }
        }
        else{
            
            $resobj = Resource::create([
                                'user_id' => Auth::user()->id,
                                'title' => $request->resource_title,
                                'description' => $request->description,
                                'embed_link' => $request->embed_url,
                                'resource_status' => 'draft'
                            ]);
            $resource = Resource::where('id', $resobj->id)->first();
            if (isset($allInputs['resource_attachment'])) {
                $file = $request->file('resource_attachment');
                $fileName = Auth::user()->id . '.' . $file->getClientOriginalExtension();
                $destinationPath = 'irh_assets/uploads/resource_files';
                $file->move($destinationPath,$fileName);
                $resource->resource_attachment = $fileName;
            }
            if(isset($allInputs['preview_attachment'])){
                $file = $request->file('preview_attachment');
                $fileName = Auth::user()->id . '.' . $file->getClientOriginalExtension();
                $destinationPath = 'irh_assets/uploads/resource_preview';
                $file->move($destinationPath,$fileName);
                $resource->preview_attachment = $fileName;
            }
            elseif(isset($allInputs['generate_preview_attachment'])){
                $resource->preview_attachment = 'dummypreview.png';
            }
            $resource->save();
            $_resource = Resource::where('id', $resobj->id)->first();
            if (!blank($_resource->title) && !blank($_resource->description) && !blank($_resource->resource_attachment) && !blank($_resource->preview_attachment)) {
                return response()->json([
                    'success' => '1', 
                    'resobj' => $resobj, 
                    'addclass' => 'whitBack'], 201);
            }
            else{
                return response()->json([
                    'success' => '1', 
                    'resobj' => $resobj], 201);
            }
        }

    }

    public function editResources(Request $request)
    {
        $filters = Tag::all();
        $resourceCategory = ResourceCategory::all();
        $resource = Resource::where('id', $request->id)->first();
        $resource_tag = ResourceTag::where('resource_id', $request->id)->get()->pluck('tag_id')->toArray();

        return view('dashboard.admin.resources.edit_resource', [
                                'edit' => '0',
                                'filters' => $filters,
                                'resourceCategory' => $resourceCategory,
                                'resource' => $resource,
                                'resource_tag' => $resource_tag
                            ]);
    }


    public function viewReportedUsers(Request $request)
    {
        $allInputs = $request->all();
        $usersObj = DB::table('users')
                            ->select('users.*', 'roles.name as role_name', 'notices_view.total_notice AS notice')
                            ->Join('notices_view', 'users.id', '=', 'notices_view.user_id')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id');

        if(isset($allInputs['query']) && !blank($allInputs['query'])){
            $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
        }

        $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath('users/pajax');


        return view('dashboard.admin.users.users_list', [
                                    'users' => $users,
                                    'allInputs' => $allInputs,
                                    'rp' => '1'
                                ]);
    }



    public function viewReportedUsersPajax(Request $request)
    {
        if ($request->ajax()) {
            $allInputs = $request->all();

            $usersObj = DB::table('users')
                            ->select('users.*', 'roles.name as role_name', 'notices_view.total_notice AS notice')
                            ->Join('notices_view', 'users.id', '=', 'notices_view.user_id')
                            ->Join('role_user', 'users.id', '=', 'role_user.user_id')
                            ->Join('roles', 'role_user.role_id', '=', 'roles.id');

            if(isset($allInputs['query']) && !blank($allInputs['query'])){
                $usersObj = $usersObj->where('users.email', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.first_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.last_name', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.username', 'like', ("%" . $allInputs['query'] . "%"))
                                    ->orWhere('users.position', 'like', ("%" . $allInputs['query'] . "%"));
            }

            $users = $usersObj->orderBy('id', 'ASC')->paginate(30)->withPath('users/pajax');

            return view('dashboard.admin.users.user_pagination', [
                                        'users' => $users,
                                        'allInputs' => $allInputs
                                    ])->render();
        }
    }



    public function delSavedResource(Request $request)
    {
        $user = User::where('id', Auth::user()->id)->first();
        $saved_resources_array = explode(",", $user->saved_resources);
        $indexCompleted = array_search($request->id, $saved_resources_array);
        unset($saved_resources_array[$indexCompleted]);
        $user->saved_resources = implode(",", $saved_resources_array);
        $user->save();

        return response()->json(['success' => '1'], 200);
    }


    public function ownProfilePassword(Request $request)
    {
        return view('dashboard.users.profile.reset_password');
    }
}
