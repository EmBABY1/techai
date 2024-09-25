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
                    <h4 class="card-title">About</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Subject</th>
                                    <th>Subject2</th>
                                    <th>Subject3</th>
                                    <th>Subject4</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($about as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->title }}</td>
                                        <td>{{ $item->subject }}</td>
                                        <td>{{ $item->subject2 }}</td>
                                        <td>{{ $item->subject3 }}</td>
                                        <td>{{ $item->subject4 }}</td>

                                        <td>
                                            <form method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit"formaction="destroyabout/{{ $item->id }}">
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
                    <h4 class="card-title">About</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Subject</th>
                                    <th>Subject2</th>
                                    <th>Subject3</th>
                                    <th>Subject4</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <form method="POST" action="insertabout">
                                        @csrf
                                        <td><input type="text" name="title" required></td>
                                        <td><input type="text" name="subject" required></td>
                                        <td><input type="text" name="subject2" required></td>
                                        <td><input type="text" name="subject3" required></td>
                                        <td><input type="text" name="subject4" required></td>
                                        <td><button type="submit" class="btn btn-primary">insert</button></td>
                                    </form>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card" id='updateTable' style="display: none">
                <div class="card-header">
                    <h4 class="card-title">About</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <table id="multi-filter-select" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Subject</th>
                                    <th>Subject2</th>
                                    <th>Subject3</th>
                                    <th>Subject4</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($about as $item)
                                    <tr>
                                        <form method="POST" action="updateabout/{{ $item->id }}">
                                            @csrf
                                            <td>{{ $item->id }}</td>
                                            <td><input type="text" name="title" value="{{ $item->title }}" required>
                                            </td>
                                            <td><input type="text" name="subject" value="{{ $item->subject }}" required>
                                            </td>
                                            <td><input type="text" name="subject2" value="{{ $item->subject2 }}"
                                                    required></td>
                                            <td><input type="text" name="subject3" value="{{ $item->subject3 }}"
                                                    required></td>
                                            <td><input type="text" name="subject4" value="{{ $item->subject4 }}"
                                                    required></td>
                                            <td><button type="submit"class="btn btn-primary">Update</button></td>
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
