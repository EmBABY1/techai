@extends('profile.myprofile')
@section('content')
    <br><br><br><br>
    <style>
        /* CSS for the table */
        table {
            margin-left: 20%;
            border-collapse: collapse;
            width: 40%;
            /* Adjust width as needed */
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            /* Header background color */
        }

        /* CSS for token div */
        .token {
            margin-left: 30%;
            font-size: 18px;
            margin-bottom: 20px;
            color: #333;
            /* Token text color */
        }
    </style>
    <table>
        <tr>
            <th>Token</th>
        </tr>
        <tr>
            <td>{{ $token }}</td>
        </tr>
        <form action="upload" enctype="multipart/form-data" method="POST">
            @csrf
            <tr>
                <td>Enter Token</td>
                <td><input type="text" name='api_token'></td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit" class="button-78">Submit</button></td>
            </tr>
        </form>
    </table>
@endsection
<style> </style>
