document.addEventListener('DOMContentLoaded', () => {
    // Select necessary DOM elements
    const userListContainer = document.querySelector('.user-list');
    const deleteConfirmationModal = document.getElementById('deleteConfirmationModal');
    const confirmDeleteYesBtn = document.getElementById('confirmDeleteYes');
    const confirmDeleteNoBtn = document.getElementById('confirmDeleteNo');
    const searchInput = document.querySelector('.search-input');
    const addUserBtn = document.getElementById('add-user-btn'); // Get the Add User button

    // Variable to temporarily store the ID of the user to be deleted
    let userToDeleteId = null;
    
    // This array holds the current list of users displayed.
    // It starts with one dummy user to ensure the box is never empty on load.
    let currentUsersData = [
        {
            id: 101, // Unique ID for initial dummy user
            name: 'Alex Eco-Warrior', // A generic, representative name
            status: 'online', // Status can be 'online' or 'offline'
            activities: [
                { name: 'Module 1: Intro to Sustainability', submitted: true },
                { name: 'Game: Recycle Run Challenge', submitted: false },
                { name: 'Module 2: Climate Change Impact', submitted: true },
                { name: 'Quiz: Green Habits', submitted: false },
                { name: 'Module 3: Renewable Energy', submitted: true }
            ]
        }
    ];

    // Keep track of the next available ID for new users
    // Start higher than initial dummy users to avoid conflicts.
    let nextUserId = 102; 

    /**
     * Renders the list of users in the userListContainer.
     * @param {Array<Object>} users - An array of user objects to display.
     */
    function renderUsers(users) {
        userListContainer.innerHTML = ''; // Clear any existing content in the user list

        // If there are no users to display, show a message
        if (users.length === 0) {
            userListContainer.innerHTML = '<p style="text-align: center; padding: 20px; color: #555;">No users found. Click "Add New User" to create one!</p>';
            return;
        }

        // Loop through each user and create their profile entry
        users.forEach(user => {
            const userEntry = document.createElement('div');
            userEntry.classList.add('user-entry');
            userEntry.setAttribute('data-user-id', user.id); // Store the user's ID on the element for easy access

            // Determine status indicator color (online/offline)
            const statusClass = user.status === 'online' ? 'online' : 'offline';

            // Build the HTML for the user's activities (modules and games)
            const activitiesHtml = user.activities && user.activities.length > 0 ?
                user.activities.map(activity => `
                    <div class="progress-item">
                        <span>${activity.name}</span>
                        <span class="status ${activity.submitted ? 'submitted' : 'pending'}">
                            ${activity.submitted ? 'Submitted' : 'Pending'}
                        </span>
                    </div>
                `).join('')
                : '<div class="progress-item"><span>No activities yet.</span></div>';

            // Construct the full HTML for the user entry using a template literal
            userEntry.innerHTML = `
                <div class="user-info">
                    <span class="status-indicator ${statusClass}"></span>
                    <span class="user-name">${user.name}</span>
                </div>
                <div class="user-progress">
                    ${activitiesHtml}
                </div>
                <div class="user-actions">
                    <button class="delete-btn" data-user-id="${user.id}">
                        <img src="trash-icon.png" alt="Delete">
                    </button>
                </div>
            `;
            userListContainer.appendChild(userEntry); // Add the new user entry to the list
        });

        // Attach event listeners to all delete buttons after they've been rendered
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', (event) => {
                userToDeleteId = event.currentTarget.dataset.userId; // Get the ID of the user to delete
                deleteConfirmationModal.style.display = 'flex'; // Show the confirmation modal
            });
        });
    }

    // --- Add New User Button Event Listener ---
    addUserBtn.addEventListener('click', () => {
        const userName = prompt("Enter the new user's name:"); // Prompt for user name

        // Only add user if a name was provided (user didn't cancel or leave empty)
        if (userName) {
            const newUserId = nextUserId++; // Assign a new unique ID
            const newStatus = Math.random() > 0.5 ? 'online' : 'offline'; // Randomly assign online/offline status

            // Default activities for a newly added user
            const newActivities = [
                { name: 'Module: Onboarding Journey', submitted: false },
                { name: 'Game: Intro to Eco-Quiz', submitted: false }
            ];

            const newUser = {
                id: newUserId,
                name: userName,
                status: newStatus,
                activities: newActivities
            };

            currentUsersData.push(newUser); // Add the new user to our local data array
            renderUsers(currentUsersData); // Re-render the entire list to show the new user
        }
    });

    // --- Initial Load: Render the dummy user immediately ---
    // This function call will run as soon as the DOM content is loaded,
    // displaying the 'Alex Eco-Warrior' profile.
    renderUsers(currentUsersData);

    // --- Search Functionality ---
    // Filters the displayed users based on the search input.
    searchInput.addEventListener('input', (event) => {
        const searchTerm = event.target.value.toLowerCase();
        const filteredUsers = currentUsersData.filter(user =>
            user.name.toLowerCase().includes(searchTerm)
        );
        renderUsers(filteredUsers); // Re-render the list with filtered users
    });

    // --- Delete Confirmation Modal Logic ---
    confirmDeleteYesBtn.addEventListener('click', async () => {
        if (userToDeleteId) {
            // "Delete" the user by filtering them out of the currentUsersData array
            currentUsersData = currentUsersData.filter(user => user.id != userToDeleteId);
            console.log(`User with ID: ${userToDeleteId} successfully "deleted" locally.`);
            renderUsers(currentUsersData); // Re-render the list after deletion
            
            userToDeleteId = null; // Reset the ID
            deleteConfirmationModal.style.display = 'none'; // Hide the modal
        }
    });

    confirmDeleteNoBtn.addEventListener('click', () => {
        userToDeleteId = null; // Reset the ID
        deleteConfirmationModal.style.display = 'none'; // Hide the modal
    });

    // Close modal if user clicks outside of it
    window.addEventListener('click', (event) => {
        if (event.target === deleteConfirmationModal) {
            userToDeleteId = null;
            deleteConfirmationModal.style.display = 'none';
        }
    });

    // Update the year in the footer dynamically
    document.getElementById('year').textContent = new Date().getFullYear(); // Current year is 2025
});