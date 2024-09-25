<?php

namespace App\Http\Middleware;

use App\Models\Visitor;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TrackVisitors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        // Get the IP address of the visitor
        // Define the specific URI you want to track, e.g., '/specific-page'
        $specificUri = '/';

        if ($request->is($specificUri)) {
            // Get the IP address of the visitor
            $ipAddress = $request->ip();

            // Log the IP address and timestamp
            Visitor::create(['ip_address' => $ipAddress]);
        }

        return $next($request);
    }
}
