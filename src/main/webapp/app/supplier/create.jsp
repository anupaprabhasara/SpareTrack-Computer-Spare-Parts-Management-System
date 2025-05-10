<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Supplier | MediSync</title>
    <link rel="shortcut icon" href="app/assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 flex">

<%@ include file="../partials/sidebar.jsp"%>

	<!-- Main Content -->
	<main class="flex-1 p-6">
	    <h1 class="text-3xl font-bold text-gray-700 dark:text-gray-200 mb-6">
	        <i class="fa-solid fa-truck"></i> Create Supplier
	    </h1>
	
	    <!-- Full-Width Form -->
	    <div class="bg-white dark:bg-gray-800 p-8 rounded-lg shadow-lg">
	        <form action="supplier" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
	            <!-- Hidden Input for Action -->
	            <input type="hidden" name="action" value="create">
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="name">
	                    Supplier Name
	                </label>
	                <input type="text" name="name" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	            </div>
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="contact_info">
	                    Contact Info
	                </label>
	                <input type="text" name="contact_info" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	            </div>
	
	            <div class="md:col-span-2">
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="address">
	                    Address
	                </label>
	                <textarea name="address" required
	                    class="w-full min-h-16 px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white"></textarea>
	            </div>
	
	            <!-- Buttons -->
	            <div class="md:col-span-2 flex justify-between mt-6">
	                <a href="supplier" class="bg-gray-500 text-white px-6 py-2 rounded-lg hover:bg-gray-600 transition">
	                    <i class="fa-solid fa-arrow-left"></i> Cancel
	                </a>
	                <button type="submit" class="bg-orange-500 text-white px-6 py-2 rounded-lg hover:bg-orange-600 transition">
	                    <i class="fa-solid fa-save"></i> Create Supplier
	                </button>
	            </div>
	        </form>
	    </div>
	</main>

</body>
</html>