<section class="cart__main-wrapper" data-cartcontext="cart-item-edit">
    <div class="edit-cart__flex-wrapper">
        <div class="car-park-info">
            <div>
                <div class="icon"></div>
                <div class="info">
                    <div class="name">Car Park Name</div>
                    <div class="address">200 Coward Street, Mascot NSW 2000</div>
                </div>
            </div>
        </div>
        <div class="datepicker">
            {{ include /misc/date-picker-calendar }}
        </div>
         <div class="toggle-switches">
            {{ include /car-park-search-components/toggle-leave-next-day }}
            {{ include /car-park-search-components/toggle-early-bird }}
        </div>
        <div class="edit-cart-timepicker">
            {{ include /car-park-search-components/time-picker }}
        </div>
        <div class="cart-item__buttons">
            <div class="primary-btn" data-btnaction="ConfirmEdit">Save</div>
            <div class="primary-btn primary-btn--red" data-btnAction="CancelEdit">Cancel</div>
        </div>
    </div>
</section>

