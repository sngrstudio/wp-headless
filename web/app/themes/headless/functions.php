<?php
    function register_my_menus() {
        register_nav_menus(
        array(
            'header-menu' => __( 'Header Menu' ),
            'extra-menu' => __( 'Extra Menu' )
        )
        );
    }
    add_action( 'init', 'register_my_menus' );
    add_theme_support('post-thumbnails');

    include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
    activate_plugin( 'wp-graphql/wp-graphql.php' );

    switch_theme('headless');
?>