<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit ${supplier.supplierName} | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 flex">

<%@ include file="../partials/sidebar.jsp"%>

<!-- Main Content -->
<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-green-700 mb-6">
        <i class="fa-solid fa-pen-to-square"></i> Edit Supplier: ${supplier.supplierName}
    </h1>

    <div class="bg-white p-8 rounded-lg shadow border border-green-200">
        <form action="supplier" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="supplierId" value="${supplier.supplierId}">

            <!-- Supplier Name -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="supplierName">Supplier Name</label>
                <input type="text" name="supplierName" value="${supplier.supplierName}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Contact Person -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="contactPerson">Contact Person</label>
                <input type="text" name="contactPerson" value="${supplier.contactPerson}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Contact Number -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="contactNumber">Contact Number</label>
                <input type="number" name="contactNumber" value="${supplier.contactNumber}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Email -->
            <div>
                <label class="block text-gray-700 font-medium mb-1" for="email">Email</label>
                <input type="email" name="email" value="${supplier.email}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <!-- Address -->
            <div class="md:col-span-2">
                <label class="block text-gray-700 font-medium mb-1" for="address">Address</label>
                <textarea name="address" rows="3" required
                          class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400 resize-none">${supplier.address}</textarea>
            </div>

            <!-- Buttons -->
            <div class="md:col-span-2 flex justify-between mt-6">
                <a href="supplier" class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600 transition">
                    <i class="fa-solid fa-arrow-left"></i> Cancel
                </a>
                <button type="submit" class="bg-green-500 text-white px-6 py-2 rounded hover:bg-green-600 transition">
                    <i class="fa-solid fa-save"></i> Save Changes
                </button>
            </div>
        </form>
    </div>
</main>

</body>
</html>