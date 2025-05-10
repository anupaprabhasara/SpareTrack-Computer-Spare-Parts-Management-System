<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Spare Parts | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        .table-container {
            max-height: 75vh;
            overflow-y: auto;
            border-radius: 8px;
        }
        .table-container thead th {
            position: sticky;
            top: 0;
            background-color: #10b981; /* Green */
            color: white;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-gray-100 flex">

<%@ include file="../partials/sidebar.jsp"%>

<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-green-700 mb-6">
        <i class="fa-solid fa-cogs"></i> Manage Spare Parts
    </h1>

    <!-- Search + Create -->
    <div class="flex justify-between items-center mb-6">
        <input type="text" id="search" placeholder="Search spare part..." class="px-4 py-2 w-1/2 border border-green-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400">
        <button class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition" onclick="window.location.href='part?action=create';">
            <i class="fa-solid fa-plus"></i> Add Spare Part
        </button>
    </div>

    <!-- Table -->
    <div class="table-container overflow-auto border border-green-200 rounded-lg bg-white shadow">
        <table class="w-full">
            <thead>
                <tr>
                    <th class="py-3 px-4 text-left">ID</th>
                    <th class="py-3 px-4 text-left">Name</th>
                    <th class="py-3 px-4 text-left">Category</th>
                    <th class="py-3 px-4 text-left">Model</th>
                    <th class="py-3 px-4 text-left">Brand</th>
                    <th class="py-3 px-4 text-left">Stock</th>
                    <th class="py-3 px-4 text-left">Unit Price</th>
                    <th class="py-3 px-4 text-left">Actions</th>
                </tr>
            </thead>
            <tbody id="partTable" class="text-gray-700">
                <c:forEach var="part" items="${parts}">
                    <tr class="border-t">
                        <td class="py-3 px-4">${part.partId}</td>
                        <td class="py-3 px-4">${part.partName}</td>
                        <td class="py-3 px-4">${part.category}</td>
                        <td class="py-3 px-4">${part.modelNumber}</td>
                        <td class="py-3 px-4">${part.brand}</td>
                        <td class="py-3 px-4">${part.quantityInStock}</td>
                        <td class="py-3 px-4">₹${part.unitPrice}</td>
                        <td class="py-3 px-4">
                            <button class="text-blue-600 hover:text-blue-800 mr-3" onclick="window.location.href='part?action=edit&id=${part.partId}'"><i class="fa-solid fa-pen-to-square"></i></button>
                            <button class="text-red-500 hover:text-red-700" onclick="confirmDelete('part?action=delete&id=${part.partId}')"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script>
    function confirmDelete(url) {
        if (confirm("Are you sure you want to delete this spare part?")) {
            window.location.href = url;
        }
    }

    document.getElementById("search").addEventListener("input", function () {
        const query = this.value.toLowerCase();
        const rows = document.querySelectorAll("#partTable tr");

        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(query) ? "" : "none";
        });
    });
</script>

</body>
</html>