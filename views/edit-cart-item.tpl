<section class="cart__main-wrapper" data-cartcontext="cart-item-edit">
    <div class="edit-cart__flex-wrapper">
        <div class="car-park-info">
            <div>
                <div class="icon"></div>
                <div class="info">
                    <div class="name">$ERR</div>
                    <div class="address">$ERR</div>
                </div>
            </div>
        </div>
        {{ include /car-park-search-components/toggle-early-bird }}
          <div class="edit-cart-timepicker">
            {{ include /car-park-search-components/time-picker }}
        </div>
        <div class="datepicker">
            {{ include /misc/edit-cart-calendar}}
        </div>
         <div class="toggle-switches">
            {{ include /car-park-search-components/toggle-leave-next-day }}
        </div>
        <div class="cart-item__buttons">
            <div class="primary-btn" data-btnaction="ConfirmEdit">Save</div>
            <div class="primary-btn primary-btn--red" data-btnAction="CancelEdit">Cancel</div>
        </div>
    </div>
</section>
