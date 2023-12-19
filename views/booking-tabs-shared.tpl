{{ include _env }}
<div class="wrapper">
    {{if {this.set_zuid} == {$bookingPageId} }}
        <h1 class="booking-tabs__main-title">Bookings</h1>
    {{else}}
        <h2 class="booking-tabs__main-title">Bookings</h2>
    {{end-if}}
    <div class="booking-tabs__tabs">
        <div class="booking-tabs__tab upcoming">Upcoming</div>
        <div class="booking-tabs__tab past">Past</div>
    </div>

    <!-- upcoming items -->
    <div class="booking-tabs__items upcoming shared">
        <!-- empty view for upcoming items-->
        {{ include /bookings-empty/bookings-upcoming-empty }}

    </div>

    <!-- past items -->
    <div class="booking-tabs__items past hidden shared">
        <!-- empty view for past items-->
        {{ include /bookings-empty/bookings-past-empty }}

    </div>

    <!-- guest view - if not logged in -->
    {{ include /bookings-empty/guest-empty }}
    <!-- loading symbol -->
    <div class="booking-tabs__loader-wrapper">
        {{ include /misc/loader }}
    </div>

</div>
{{ include /booking-item/booking-item-template }}