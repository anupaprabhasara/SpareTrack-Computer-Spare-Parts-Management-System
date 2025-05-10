<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="min-h-screen flex items-center justify-center bg-gradient-to-br from-green-100 via-green-200 to-green-300">

    <div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-md border border-green-200">
        <h2 class="text-3xl font-bold text-center text-green-700 mb-6">SpareTrack Login</h2>

        <!-- Error Alert -->
        <c:if test="${not empty error}">
            <div class="bg-red-100 text-red-700 border border-red-400 p-3 rounded mb-4 text-sm">
                <i class="fa-solid fa-triangle-exclamation mr-2"></i>${error}
            </div>
        </c:if>

        <!-- Login Form -->
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-4">
                <label for="email" class="block font-medium text-gray-700 mb-1">
                    <i class="fa-solid fa-envelope mr-1"></i> Email
                </label>
                <input type="email" id="email" name="email" class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400" placeholder="admin@example.com" required>
            </div>

            <div class="mb-6">
                <label for="password" class="block font-medium text-gray-700 mb-1">
                    <i class="fa-solid fa-lock mr-1"></i> Password
                </label>
                <input type="password" id="password" name="password" class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400" placeholder="••••••••" required>
            </div>

            <button type="submit" class="w-full bg-green-500 text-white font-semibold py-2 rounded hover:bg-green-600 transition">
                <i class="fa-solid fa-right-to-bracket mr-2"></i> Login
            </button>
        </form>
    </div>

</body>
</html>