<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Suppliers | MediSync</title>
    <link rel="shortcut icon" href="app/assets/favicon.png" type="image/x-icon">
    <style>
        /* Hide scroll bars on entire page */
        ::-webkit-scrollbar {
            display: none;
        }

        /* Ensure the table header remains fixed */
        .table-container {
            max-height: 75vh;
            overflow-y: auto;
            border-radius: 8px;
        }

        .table-container thead th {
            position: sticky;
            top: 0;
            background-color: #f97316; /* Orange background */
            color: white;
            z-index: 10;
        }

        /* Dark mode support */
        .dark .table-container thead th {
            background-color: #b45309; /* Dark orange */
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 flex">
	
<%@ include file="../partials/sidebar.jsp"%>

    <!-- Main Content -->
    <main class="flex-1 p-6">
        <h1 class="text-3xl font-bold text-gray-700 dark:text-gray-200 mb-6">
            <i class="fa-solid fa-truck"></i> Manage Suppliers
        </h1>

        <!-- Search & Create Button -->
        <div class="flex justify-between items-center mb-6">
            <input type="text" id="search" placeholder="Search supplier..."
                class="px-4 py-2 w-1/2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-gray-300 dark:focus:ring-gray-500 dark:bg-gray-700 dark:text-white">
            <button class="bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition" onclick="window.location.href='supplier?action=create';">
                <i class="fa-solid fa-plus"></i> Create Supplier
            </button>
        </div>

        <!-- Scrollable Table Container -->
        <div class="table-container overflow-auto border border-gray-300 dark:border-gray-600 rounded-lg">
            <table class="w-full bg-white dark:bg-gray-800 rounded-lg shadow-md">
                <thead>
                    <tr>
                        <th class="py-3 px-4 text-left">ID</th>
                        <th class="py-3 px-4 text-left">Name</th>
                        <th class="py-3 px-4 text-left">Contact Info</th>
                        <th class="py-3 px-4 text-left">Address</th>
                        <th class="py-3 px-4 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody id="supplierTable" class="text-gray-700 dark:text-gray-200">
                	<c:forEach var="supplier" items="${suppliers}">
	                    <tr class="border-t dark:border-gray-600">
	                        <td class="py-3 px-4">${supplier.supplierId}</td>
	                        <td class="py-3 px-4">${supplier.name}</td>
	                        <td class="py-3 px-4">${supplier.contactInfo}</td>
	                        <td class="py-3 px-4">${supplier.address}</td>
	                        <td class="py-3 px-4">
	                            <button class="text-blue-500 hover:text-blue-700 mr-3" onclick="window.location.href='supplier?action=edit&id=${supplier.supplierId}';"><i class="fa-solid fa-edit"></i></button>
	                            <button class="text-red-500 hover:text-red-700" onclick="confirmAction('supplier?action=delete&id=${supplier.supplierId}')"><i class="fa-solid fa-trash"></i></button>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <script>
    	// Delete alert
	    function confirmAction(url) {
	        if (confirm("Delete this supplier? This action is irreversible!")) {
	            window.location.href = url;
	        }
	    }
	    
        // Search function
        document.getElementById("search").addEventListener("input", function () {
            const query = this.value.toLowerCase();
            const rows = document.querySelectorAll("#supplierTable tr");

            rows.forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(query) ? "" : "none";
            });
        });
    </script>

</body>
</html>