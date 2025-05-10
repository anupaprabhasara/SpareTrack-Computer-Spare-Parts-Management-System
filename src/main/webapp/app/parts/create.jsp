<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Spare Part | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 flex">

<%@ include file="../partials/sidebar.jsp"%>

<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-green-700 mb-6">
        <i class="fa-solid fa-screwdriver-wrench"></i> Create Spare Part
    </h1>

    <div class="bg-white p-8 rounded-lg shadow border border-green-200">
        <form action="part" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input type="hidden" name="action" value="create">

            <div>
                <label class="block text-gray-700 font-medium mb-1">Part Name</label>
                <input type="text" name="partName" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Category</label>
                <input type="text" name="category" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Model Number</label>
                <input type="text" name="modelNumber" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Brand</label>
                <input type="text" name="brand" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Quantity In Stock</label>
                <input type="number" name="quantityInStock" min="0" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Unit Price</label>
                <input type="number" name="unitPrice" min="0" step="0.01" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div class="md:col-span-2">
                <label class="block text-gray-700 font-medium mb-1">Description</label>
                <textarea name="description" rows="4"
                          class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400"
                          placeholder="Optional description..."></textarea>
            </div>

            <!-- Buttons -->
            <div class="md:col-span-2 flex justify-between mt-6">
                <a href="part" class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600 transition">
                    <i class="fa-solid fa-arrow-left"></i> Cancel
                </a>
                <button type="submit" class="bg-green-500 text-white px-6 py-2 rounded hover:bg-green-600 transition">
                    <i class="fa-solid fa-save"></i> Create Part
                </button>
            </div>
        </form>
    </div>
</main>

</body>
</html>