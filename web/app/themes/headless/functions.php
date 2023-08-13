<?php
    function register_my_menus() {
        register_nav_menus(
        array(
            'primary-menu' => __( 'Primary Menu' ),
            'secondary-menu' => __( 'Secondary Menu' ),
            'tertiary-menu' => __( 'Tertiary Menu' )
        )
        );
    }
    add_action( 'init', 'register_my_menus' );
    add_theme_support('post-thumbnails');

    include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
    activate_plugin( 'wp-graphql/wp-graphql.php' );

    switch_theme('headless');
?>