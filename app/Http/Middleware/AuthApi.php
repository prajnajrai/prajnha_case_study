<?php

namespace App\Http\Middleware;

use Closure;
use Response;

class AuthApi
{
    /**
    * Handle an incoming request.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  \Closure  $next
    * @return mixed
    */
    public function handle($request, Closure $next)
    {
        if(!isset($_SERVER['HTTP_API_KEY'])){  
            return Response::json(array('error'=>'Unauthenticated'));  
        }  
  
        if($_SERVER['HTTP_API_KEY'] != env('API_KEY')){  
            return Response::json(array('error'=>'Unauthenticated API KEY'));  
        }
  
        return $next($request);
    }
}