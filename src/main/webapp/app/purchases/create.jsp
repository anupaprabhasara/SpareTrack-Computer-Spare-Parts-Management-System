<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Purchase Order | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 flex">

<%@ include file="../partials/sidebar.jsp"%>

<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-green-700 mb-6">
        <i class="fa-solid fa-file-circle-plus"></i> Create Purchase Order
    </h1>

    <div class="bg-white p-8 rounded-lg shadow border border-green-200">
        <form action="purchase" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input type="hidden" name="action" value="create">

            <!-- Part -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="partId">Spare Part</label>
                <select name="partId" required class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
                    <option value="">Select Part</option>
                    <c:forEach var="part" items="${parts}">
                        <option value="${part.partId}">${part.partName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Supplier -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="supplierId">Supplier</label>
                <select name="supplierId" required class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
                    <option value="">Select Supplier</option>
                    <c:forEach var="supplier" items="${suppliers}">
                        <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Quantity -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="quantityOrdered">Quantity Ordered</label>
                <input type="number" name="quantityOrdered" required min="1"
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Order Date -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="orderDate">Order Date</label>
                <input type="date" name="orderDate" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Received Date -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="receivedDate">Received Date</label>
                <input type="date" name="receivedDate"
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Ordered By -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="orderedBy">Ordered By</label>
                <select name="orderedBy" required class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
                    <option value="">Select Admin</option>
                    <c:forEach var="admin" items="${admins}">
                        <option value="${admin.adminId}">${admin.fullName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Buttons -->
            <div class="md:col-span-2 flex justify-between mt-6">
                <a href="purchase" class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600 transition">
                    <i class="fa-solid fa-arrow-left"></i> Cancel
                </a>
                <button type="submit" class="bg-green-500 text-white px-6 py-2 rounded hover:bg-green-600 transition">
                    <i class="fa-solid fa-save"></i> Save Order
                </button>
            </div>
        </form>
    </div>
</main>

</body>
</html>