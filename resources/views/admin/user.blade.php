@extends('admin.admin')
@section('Admin')
    <div class="row">
        <div class="col-md-12">
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
            @endif
            <button id="showuser" onclick="toggleTable()"class='btn btn-black'>Show</button>
            <button id="insertuser" onclick="toggleInsertTable()"class='btn btn-black'> Insert </button>
            <button id="updateuser" onclick="toggleUpdateTable()"class='btn btn-black'> Update </button>
            <script></script>
            <div class="card" id='userTable' style="display: none">
                <div class="card-header">
                    <h4 class="card-title">Users</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Created At</th>
                                    <th>Updated At</th>
                                    <th>Role</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->name }}</td>
                                        <td>{{ $item->email }}</td>
                                        <td>{{ $item->created_at }}</td>
                                        <td>{{ $item->updated_at }}</td>
                                        <td>{{ $item->role_as }}</td>
                                        <td>
                                            <form method="POST" action="destroyuser/{{ $item->id }}">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit">
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Red_x.svg/1200px-Red_x.svg.png"
                                                        height="20px" width="20px">
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="card" id='insertTable' style="display: none">
                <div class="card-header">
                    <h4 class="card-title">Users</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <form method="POST">
                                        @csrf
                                        <td><input type="text" name="name" required></td>
                                        <td><input type="email" name="email" required></td>
                                        <td><input type="password" name="password" required></td>
                                        <td><input type="text" name="role_as" required></td>
                                        <td><button type="submit"formaction="storeuser"
                                                class="btn btn-primary">Insert</button></td>
                                    </form>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card" id='updateTable' style="display: none">
                <div class="card-header">
                    <h4 class="card-title">Users</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>password</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <form method="POST" action="updateuser/{{ $user->id }}">
                                            @csrf
                                            <td>{{ $user->id }}</td>
                                            <td><input type="text" name="name" value="{{ $user->name }}" required>
                                            </td>
                                            <td><input type="email" name="email" value="{{ $user->email }}" required>
                                            </td>
                                            <td><input type="password" name="password"
                                                    placeholder="Leave blank to keep current password"></td>
                                            <td><input type="text" name="role_as" value="{{ $user->role_as }}" required>
                                            </td>
                                            <td><button class="btn btn-primary" type="submit">Update</button></td>
                                        </form>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function toggleTable() {
            var table = document.getElementById("userTable");
            if (table.style.display === "none") {
                table.style.display = "table";
            } else {
                table.style.display = "none";
            }
        }

        function toggleInsertTable() {
            var table = document.getElementById("insertTable");
            if (table.style.display === "none") {
                table.style.display = "table";
            } else {
                table.style.display = "none";
            }
        }

        function toggleUpdateTable() {
            var table = document.getElementById("updateTable");
            if (table.style.display === "none") {
                table.style.display = "table";
            } else {
                table.style.display = "none";
            }
        }
    </script>
    <!--   Core JS Files   -->
    <script src="../assets1/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets1/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../assets1/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../assets1/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="../assets1/js/kaiadmin.min.js"></script>
    <script src="../assets1/js/setting-demo2.js"></script>
    <script>
        $(document).ready(function() {
            $("#basic-datatables").DataTable({});

            $("#multi-filter-select").DataTable({
                pageLength: 5,
                initComplete: function() {
                    this.api()
                        .columns()
                        .every(function() {
                            var column = this;
                            var select = $(
                                    '<select class="form-select"><option value=""></option></select>'
                                )
                                .appendTo($(column.footer()).empty())
                                .on("change", function() {
                                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                    column
                                        .search(val ? "^" + val + "$" : "", true, false)
                                        .draw();
                                });

                            column
                                .data()
                                .unique()
                                .sort()
                                .each(function(d, j) {
                                    select.append(
                                        '<option value="' + d + '">' + d + "</option>"
                                    );
                                });
                        });
                },
            });

            // Add Row
            $("#add-row").DataTable({
                pageLength: 5,
            });

            var action =
                '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

            $("#addRowButton").click(function() {
                $("#add-row")
                    .dataTable()
                    .fnAddData([
                        $("#addName").val(),
                        $("#addPosition").val(),
                        $("#addOffice").val(),
                        action,
                    ]);
                $("#addRowModal").modal("hide");
            });
        });
    </script>
@endsection
