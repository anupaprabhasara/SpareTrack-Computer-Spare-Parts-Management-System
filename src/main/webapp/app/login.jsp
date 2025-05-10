<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | MediSync Dashboard</title>
    <link rel="shortcut icon" href="app/assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 flex items-center justify-center min-h-screen">

    <div class="bg-white dark:bg-gray-800 shadow-lg rounded-lg p-8 w-full max-w-md">
        <h2 class="text-2xl font-bold text-center text-gray-700 dark:text-gray-200">Login</h2>
        
        <!-- Login Form -->
        <form class="mt-6" method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-4">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2" for="email">
                    <i class="fa-solid fa-user"></i> Email
                </label>
                <input type="email" id="email" name="email" class="w-full px-4 py-2 rounded-lg border dark:border-gray-600 focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-gray-700 dark:text-white" placeholder="Enter your email" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2" for="password">
                    <i class="fa-solid fa-lock"></i> Password
                </label>
                <input type="password" id="password" name="password" class="w-full px-4 py-2 rounded-lg border dark:border-gray-600 focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-gray-700 dark:text-white" placeholder="Enter your password" required>
            </div>

            <!-- Remember Me & Forgot Password -->
            <div class="flex items-center justify-between mb-6">
                <label class="flex items-center">
                    <input type="checkbox" class="form-checkbox text-orange-500">
                    <span class="ml-2 text-gray-600 dark:text-gray-300 text-sm">Remember me</span>
                </label>
                <a href="mailto:admin@medisync.com" class="text-orange-500 hover:underline text-sm">Forgot password?</a>
            </div>
            
            <!-- Display error message if login fails -->
	        <c:if test="${not empty error}">
	            <div class="bg-red-500 bg-opacity-20 text-red-700 border border-red-500 p-3 rounded-lg text-sm mb-4 flex items-center">
	                <p><i class="fa-solid fa-exclamation-circle mr-2"></i>${error}</p>
	            </div>
	        </c:if>

            <!-- Login Button -->
            <button type="submit" class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600 transition duration-200">
                <i class="fa-solid fa-sign-in-alt"></i> Login
            </button>
        </form>
    </div>

</body>
</html>