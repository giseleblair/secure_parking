<section class="home__bookings logged-in" style="display: none;">
    <div class="wrapper">
        <div class="upcoming-home">
            <div class="home__heading-wrapper">
                <h2 class="home__heading">Upcoming Booking</h2>
            </div>
            <div class="booking-items">
                {{ include /bookings-empty/bookings-upcoming-empty }}
            </div>
        </div>
        <div class="past-home">
            <div class="home__heading-wrapper">
                <h2 class="home__heading">Quick Rebook</h2>
            </div>
            <div class="booking-items">
                {{ include /bookings-empty/bookings-past-empty }}
            </div>
        </div>
        {{ include /bookings-empty/guest-empty }}
    </div>
    <!-- loading symbol -->
    <div class="wrapper">
    {{ include /misc/loader }}
    </div>
</section>