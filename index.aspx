<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Epic Travel - Presentation Studio</title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;family=Newsreader:ital,opsz,wght@0,6..72,300..700;1,6..72,300..700&amp;family=Outfit:wght@300;400;500;600;700&amp;family=JetBrains+Mono:wght@400;500&amp;display=swap" rel="stylesheet">
    
    <style>
        /* CSS Design Tokens / Variables */
        :root {
            /* Quiet Luxury Theme (Default Colors) */
            --bg-base: #fff9ef;
            --bg-card: #ffffff;
            --bg-sidebar: #2a2520;
            --text-primary: #1d1b16;
            --text-secondary: #4e453b;
            --text-on-sidebar: #f6f0e6;
            --text-sidebar-muted: #8c8275;
            --primary: #735a36;
            --primary-light: #c8a97e;
            --primary-container: #ffddb0;
            --secondary: #3d5a4c;
            --secondary-light: #c9ead8;
            --border-color: rgba(127, 118, 106, 0.15);
            --shadow-ambient: 0 8px 30px rgba(42, 37, 32, 0.04);
            --font-serif: 'Newsreader', serif;
            --font-sans: 'Inter', sans-serif;
            --font-mono: 'JetBrains Mono', monospace;
            --radius-sm: 4px;
            --radius-md: 8px;
            --radius-lg: 16px;
            --radius-xl: 24px;
        }

        /* Basic Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: var(--font-sans);
            background-color: var(--bg-base);
            color: var(--text-primary);
            overflow: hidden;
            height: 100vh;
            width: 100vw;
            display: flex;
            transition: background-color 0.4s ease, color 0.4s ease;
        }

        /* App Container Layout */
        #app-container {
            display: flex;
            width: 100vw;
            height: 100vh;
            position: relative;
        }

        /* Left Sidebar Navigation */
        .sidebar {
            width: 300px;
            background-color: var(--bg-sidebar);
            color: var(--text-on-sidebar);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 30px 20px;
            z-index: 10;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
            border-right: 1px solid var(--border-color);
            flex-shrink: 0;
        }
        .logo-section {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
        }
        .logo-text {
            font-family: var(--font-serif);
            font-size: 24px;
            font-weight: 400;
            letter-spacing: -0.02em;
            color: var(--text-on-sidebar);
        }
        .logo-text span {
            color: var(--primary-light);
            font-style: italic;
        }
        
        .sidebar-controls {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 20px;
        }
        .sidebar-controls-row {
            display: flex;
            gap: 8px;
        }
        .sidebar-btn {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-on-sidebar);
            padding: 8px;
            border-radius: var(--radius-md);
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }
        .sidebar-btn:hover {
            background-color: rgba(255, 255, 255, 0.15);
            border-color: var(--primary-light);
        }
        
        .nav-list-wrapper {
            flex-grow: 1;
            overflow-y: auto;
            margin-right: -10px;
            padding-right: 10px;
            margin-bottom: 20px;
        }
        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .nav-item {
            padding: 10px 14px;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
            color: var(--text-sidebar-muted);
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            position: relative;
        }
        .nav-item:hover, .nav-item.active {
            color: var(--text-on-sidebar);
            background-color: rgba(255, 255, 255, 0.05);
        }
        .nav-item.active {
            border-left: 3px solid var(--primary-light);
            padding-left: 11px;
        }
        .nav-item.dragging {
            opacity: 0.4;
            border: 1px dashed var(--primary-light) !important;
        }
        .nav-item.drag-over {
            border-top: 2px solid var(--primary-light) !important;
            background-color: rgba(255, 255, 255, 0.1) !important;
        }
        .nav-item-title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            flex-grow: 1;
        }
        .nav-num {
            font-family: var(--font-mono);
            font-size: 10.5px;
            opacity: 0.5;
        }
        .delete-slide-btn {
            opacity: 0;
            color: #ff8b8b;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            padding: 0 4px;
            transition: opacity 0.2s ease;
        }
        .nav-item:hover .delete-slide-btn {
            opacity: 1;
        }
        .sidebar-footer {
            font-size: 10px;
            color: var(--text-sidebar-muted);
            line-height: 1.5;
        }

        /* Top Action Bar */
        .top-actions {
            position: absolute;
            top: 25px;
            right: 40px;
            display: flex;
            gap: 12px;
            z-index: 95;
        }
        .btn {
            background-color: var(--bg-card);
            border: 1px solid var(--border-color);
            color: var(--text-primary);
            padding: 10px 18px;
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: var(--shadow-ambient);
        }
        .btn:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-hover);
            border-color: var(--primary-light);
        }
        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: white;
            border: none;
        }
        .btn-primary:hover {
            opacity: 0.95;
        }
        .theme-toggle {
            width: 40px;
            height: 40px;
            padding: 0;
            justify-content: center;
            border-radius: 50%;
        }

        /* Main Presentation Canvas */
        .stage {
            flex-grow: 1;
            position: relative;
            background-color: var(--bg-base);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            overflow: hidden;
            transition: background-color 0.4s ease;
        }

        /* Slide Dimensions matching standard 16:9 widescreen */
        .slide-deck {
            width: 100%;
            aspect-ratio: 16 / 9;
            max-width: 1366px;
            max-height: 768px;
            position: relative;
            background-color: var(--bg-card);
            box-shadow: 0 20px 55px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: var(--radius-sm);
        }

        /* Slide layout styles - 50/50 Split (Unified Text + Image) */
        .slide-container {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: none;
            opacity: 0;
            transform: scale(0.98) translateX(15px);
            transition: opacity 0.5s cubic-bezier(0.16, 1, 0.3, 1), transform 0.5s cubic-bezier(0.16, 1, 0.3, 1);
            z-index: 1;
        }
        .slide-container.active {
            display: flex;
            opacity: 1;
            transform: scale(1) translateX(0);
            z-index: 2;
        }

        /* Split Screen Structure */
        .slide-split-wrapper {
            display: flex;
            width: 100%;
            height: 100%;
        }
        .slide-text-pane {
            width: 42%;
            height: 100%;
            background-color: var(--bg-card);
            padding: 55px 45px 45px 55px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            overflow-y: auto;
            flex-shrink: 0;
            transition: background-color 0.4s ease;
        }
        .slide-image-pane {
            width: 58%;
            height: 100%;
            position: relative;
            overflow: hidden;
            background-color: #222;
        }
        
        /* Drag and Drop Visual Feedback Overlay */
        .dropzone-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(200, 169, 126, 0.15);
            border: 4px dashed var(--primary-light);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 15;
            pointer-events: none;
        }
        .slide-image-pane.dragover .dropzone-overlay {
            display: flex;
        }
        .dropzone-text {
            background-color: rgba(42, 37, 32, 0.85);
            color: #ffffff;
            padding: 10px 20px;
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 500;
        }

        .slide-full-bleed-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            opacity: 0;
            transform: scale(1.05);
        }

        /* Title text hierarchy */
        .slide-title-header {
            margin-bottom: 25px;
        }
        .slide-heading-main {
            font-family: var(--font-sans);
            font-size: 32px;
            font-weight: 600;
            line-height: 1.25;
            color: var(--text-primary);
            opacity: 0;
            transition: color 0.4s ease;
        }
        .slide-heading-main span {
            text-decoration: underline;
            text-decoration-color: var(--primary-light);
            text-underline-offset: 4px;
        }
        .slide-heading-subtitle {
            font-family: var(--font-mono);
            font-size: 11px;
            font-weight: 500;
            color: var(--primary-light);
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 6px;
            opacity: 0;
        }

        /* Bullet Points list */
        .slide-content-bullets {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 14px;
            margin-top: 10px;
        }
        .slide-content-bullets li {
            position: relative;
            padding-left: 20px;
            font-size: 15px;
            color: var(--text-secondary);
            line-height: 1.5;
            opacity: 0;
            transition: color 0.4s ease;
        }
        .slide-content-bullets li::before {
            content: "•";
            position: absolute;
            left: 2px;
            top: -2px;
            color: var(--primary-light);
            font-size: 20px;
        }
        .slide-content-bullets li strong {
            color: var(--text-primary);
        }

        /* Micro-Animations for slide changes */
        @keyframes slideUpFade {
            from {
                opacity: 0;
                transform: translateY(12px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes zoomInReveal {
            from {
                opacity: 0.5;
                transform: scale(1.04);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Animation Trigger rules when slide becomes active */
        .slide-container.active .slide-heading-subtitle {
            animation: slideUpFade 0.5s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        .slide-container.active .slide-heading-main {
            animation: slideUpFade 0.5s cubic-bezier(0.16, 1, 0.3, 1) 0.08s forwards;
        }
        .slide-container.active .slide-full-bleed-image {
            animation: zoomInReveal 0.7s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        .slide-container.active .slide-content-bullets li {
            animation: slideUpFade 0.45s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        
        /* Staggered updates for list items */
        .slide-container.active .slide-content-bullets li:nth-child(1) { animation-delay: 0.15s; }
        .slide-container.active .slide-content-bullets li:nth-child(2) { animation-delay: 0.22s; }
        .slide-container.active .slide-content-bullets li:nth-child(3) { animation-delay: 0.29s; }
        .slide-container.active .slide-content-bullets li:nth-child(4) { animation-delay: 0.36s; }
        .slide-container.active .slide-content-bullets li:nth-child(5) { animation-delay: 0.43s; }
        .slide-container.active .slide-content-bullets li:nth-child(6) { animation-delay: 0.5s; }
        .slide-container.active .slide-content-bullets li:nth-child(7) { animation-delay: 0.57s; }
        .slide-container.active .slide-content-bullets li:nth-child(8) { animation-delay: 0.64s; }
        .slide-container.active .slide-content-bullets li:nth-child(9) { animation-delay: 0.71s; }
        .slide-container.active .slide-content-bullets li:nth-child(10) { animation-delay: 0.78s; }
        .slide-container.active .slide-content-bullets li:nth-child(11) { animation-delay: 0.85s; }

        /* Other layouts text animations */
        .slide-container.active .quote-container {
            animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) 0.15s forwards;
            opacity: 0;
        }

        /* Cover Slide Layout (Full Screen) */
        .cover-slide-layout {
            position: relative;
            width: 100%;
            height: 100%;
            background-color: var(--bg-card);
        }
        .cover-slide-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.95;
            transform: scale(1.05);
        }
        .slide-container.active .cover-slide-bg {
            animation: zoomInReveal 1.2s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        .cover-slide-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(180deg, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.3) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .cover-slide-title-img {
            max-width: 70%;
            max-height: 70%;
            object-fit: contain;
            filter: drop-shadow(0 10px 25px rgba(0,0,0,0.25));
            opacity: 0;
            transform: translateY(15px);
        }
        .slide-container.active .cover-slide-title-img {
            animation: slideUpFade 0.8s cubic-bezier(0.16, 1, 0.3, 1) 0.2s forwards;
        }

        /* Keyboard Controls Floating Help */
        .controls-help {
            position: absolute;
            bottom: 25px;
            right: 40px;
            font-size: 11px;
            color: var(--text-secondary);
            display: flex;
            gap: 15px;
            opacity: 0.6;
            transition: opacity 0.2s ease;
            z-index: 20;
        }
        .controls-help span kbd {
            background-color: var(--bg-card);
            border: 1px solid var(--border-color);
            padding: 2px 6px;
            border-radius: var(--radius-sm);
            font-family: var(--font-mono);
            font-size: 10px;
        }

        /* Interactive Presenter Tools Elements */
        #laser-pointer {
            position: absolute;
            width: 14px;
            height: 14px;
            border-radius: 50%;
            background-color: #ff2222;
            box-shadow: 0 0 12px 6px rgba(255, 34, 34, 0.85);
            pointer-events: none;
            transform: translate(-50%, -50%);
            z-index: 1000;
            display: none;
        }
        #markup-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 90;
        }
        #markup-canvas.active {
            pointer-events: auto;
            cursor: crosshair;
        }

        /* Presenter Notes Modal Overlay */
        .presenter-notes-modal {
            position: absolute;
            bottom: 30px;
            left: 40px;
            background-color: rgba(42, 37, 32, 0.95);
            backdrop-filter: blur(10px);
            color: #f6f0e6;
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: var(--radius-md);
            padding: 15px;
            width: 320px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.35);
            z-index: 60;
            display: none;
            cursor: move;
        }
        .presenter-notes-title {
            font-size: 10.5px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--primary-light);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 6px;
            margin-bottom: 8px;
        }
        .presenter-notes-content {
            font-size: 13px;
            line-height: 1.5;
            max-height: 180px;
            overflow-y: auto;
        }

        /* Slide Progress Timeline Bar */
        .progress-timeline {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: rgba(0, 0, 0, 0.1);
            z-index: 99;
        }
        .progress-timeline-fill {
            height: 100%;
            width: 0%;
            background-color: var(--primary-light);
            transition: width 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        /* Floating Nav Controllers Overlay (Fades in when presenting) */
        .floating-nav-overlay {
            position: absolute;
            bottom: 30px;
            right: 40px;
            display: flex;
            gap: 8px;
            z-index: 50;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none; /* Allows click through when invisible */
        }
        body.presentation-mode .floating-nav-overlay {
            pointer-events: auto; /* Active when visible */
        }
        body.presentation-mode:hover .floating-nav-overlay,
        body.presentation-mode .floating-nav-overlay:hover {
            opacity: 0.85;
        }
        .float-nav-btn {
            background-color: rgba(42, 37, 32, 0.85);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #ffffff;
            height: 40px;
            padding: 0 12px;
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            font-size: 12.5px;
            font-weight: 500;
            gap: 4px;
        }
        .float-nav-btn:hover {
            transform: translateY(-1px);
            background-color: var(--primary-light);
            color: #2a2520;
        }
        .float-nav-btn.active {
            background-color: #ff4d4d;
            color: white;
            border-color: #ff4d4d;
        }

        /* Presentation Mode */
        body.presentation-mode .sidebar,
        body.presentation-mode .top-actions,
        body.presentation-mode .controls-help {
            display: none !important;
        }
        body.presentation-mode .stage {
            padding: 0;
            background-color: #000000;
        }
        body.presentation-mode .slide-deck {
            max-width: 100vw;
            max-height: 100vh;
            width: 100vw;
            height: 100vh;
            border-radius: 0;
            box-shadow: none;
        }

        /* Interactive Editor Side-Drawer */
        .editor-drawer {
            position: fixed;
            top: 0;
            right: -420px;
            width: 400px;
            height: 100vh;
            background-color: var(--bg-card);
            border-left: 1px solid var(--border-color);
            box-shadow: -10px 0 30px rgba(0,0,0,0.05);
            z-index: 100;
            transition: right 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            display: flex;
            flex-direction: column;
            padding: 30px 20px;
        }
        .editor-drawer.open {
            right: 0;
        }
        .editor-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
        }
        .editor-body {
            flex-grow: 1;
            overflow-y: auto;
            padding-right: 5px;
        }
        .editor-group {
            margin-bottom: 16px;
        }
        .editor-label {
            display: block;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 6px;
            color: var(--text-secondary);
        }
        .editor-input, .editor-textarea, .editor-select {
            width: 100%;
            padding: 10px 12px;
            border-radius: var(--radius-md);
            border: 1px solid var(--border-color);
            background-color: var(--bg-base);
            color: var(--text-primary);
            font-family: var(--font-sans);
            font-size: 13px;
            transition: border-color 0.2s ease;
        }
        .editor-input:focus, .editor-textarea:focus, .editor-select:focus {
            outline: none;
            border-color: var(--primary-light);
        }
        .editor-textarea {
            resize: vertical;
            min-height: 100px;
        }
        .editor-actions-row {
            display: flex;
            gap: 8px;
            margin-top: 15px;
        }
        .editor-btn-sub {
            flex: 1;
            background-color: var(--bg-base);
            border: 1px solid var(--border-color);
            padding: 8px;
            border-radius: var(--radius-md);
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
        }
        .editor-btn-sub:hover {
            border-color: var(--primary-light);
            background-color: var(--bg-card);
        }

        /* Image Selection Gallery */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 8px;
            margin-top: 8px;
            max-height: 140px;
            overflow-y: auto;
            border: 1px solid var(--border-color);
            padding: 6px;
            border-radius: var(--radius-md);
            background: var(--bg-base);
        }
        .gallery-img {
            width: 100%;
            height: 48px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.2s ease;
        }
        .gallery-img:hover, .gallery-img.selected {
            border-color: var(--primary-light);
            transform: scale(1.03);
        }

        /* Drag and Drop instructions block inside editor */
        .editor-drop-zone {
            border: 2px dashed var(--border-color);
            border-radius: var(--radius-md);
            padding: 15px;
            text-align: center;
            font-size: 12px;
            color: var(--text-secondary);
            background-color: var(--bg-base);
            cursor: pointer;
            transition: border-color 0.2s ease;
            margin-top: 10px;
        }
        .editor-drop-zone:hover {
            border-color: var(--primary-light);
            color: var(--text-primary);
        }

        /* Modal Overlay */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0,0,0,0.4);
            backdrop-filter: blur(4px);
            z-index: 200;
            display: none;
            align-items: center;
            justify-content: center;
        }
        .modal-overlay.open {
            display: flex;
        }
        .modal-card {
            background-color: var(--bg-card);
            border-radius: var(--radius-lg);
            padding: 30px;
            width: 400px;
            box-shadow: var(--shadow-hover);
            border: 1px solid var(--border-color);
        }
        .modal-title {
            font-family: var(--font-serif);
            font-size: 22px;
            margin-bottom: 20px;
        }

        /* Print formatting */
        @media print {
            @page {
                size: landscape;
                margin: 0;
            }
            body {
                background: white;
                color: black;
                overflow: visible;
                height: auto;
                width: auto;
            }
            #app-container {
                display: block !important;
                height: auto !important;
                width: auto !important;
                overflow: visible !important;
            }
            .sidebar, .top-actions, .controls-help, .editor-drawer, .floating-nav-overlay {
                display: none !important;
            }
            .stage {
                padding: 0;
                margin: 0;
                overflow: visible !important;
                height: auto !important;
                width: auto !important;
                display: block !important;
                background: none !important;
            }
            .slide-deck {
                max-width: 100% !important;
                max-height: 100% !important;
                width: 100% !important;
                height: auto !important;
                box-shadow: none !important;
                border: none !important;
                overflow: visible !important;
                border-radius: 0 !important;
            }
            .slide-container {
                display: flex !important;
                opacity: 1 !important;
                break-after: page;
                page-break-after: always;
                height: 100vh !important;
                width: 100vw !important;
                transform: none !important;
                transition: none !important;
                position: relative !important;
            }
            .slide-split-wrapper {
                width: 100% !important;
                height: 100% !important;
            }
            .slide-text-pane {
                background-color: var(--bg-card) !important;
                color: var(--text-primary) !important;
            }
            .slide-full-bleed-image {
                opacity: 1 !important;
                transform: none !important;
            }
            
            /* Enforce opacity and override fade-in screen animations on elements */
            .slide-heading-main,
            .slide-heading-subtitle,
            .slide-content-bullets li,
            .slide-full-bleed-image,
            .quote-container,
            .cover-slide-title-img,
            .cover-slide-bg {
                opacity: 1 !important;
                transform: none !important;
                animation: none !important;
            }
            
            /* Force background graphics to print in PDF */
            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
        }
    </style>
</head>
<body>

    <div id="app-container">
        
        <!-- Left Sidebar Navigation (The Leather Spine) -->
        <aside class="sidebar">
            <div style="display: flex; flex-direction: column; flex-grow: 1; overflow: hidden; min-height: 0;">
                <div class="logo-section">
                    <h1 class="logo-text">Epic<span>Travel</span></h1>
                </div>
                <div class="meeting-tag">Monthly Progress</div>
                
                <!-- Slide List Management Controls -->
                <div class="sidebar-controls">
                    <button class="sidebar-btn" data-action="openAddSlideModal">➕ Add Slide</button>
                    <div class="sidebar-controls-row">
                        <button class="sidebar-btn" data-action="openRemindersModal">🔔 Reminders</button>
                        <button class="sidebar-btn" data-action="print" title="Export deck to PDF">📤 Export PDF</button>
                    </div>
                    <button class="sidebar-btn" style="color: #ff8b8b; margin-top: 4px;" data-action="resetToDefault">🔄 Reset Template</button>
                </div>
                
                <div class="nav-list-wrapper">
                    <ul class="nav-list" id="nav-list">
                        <!-- Nav items generated by JS -->
                    </ul>
                </div>
            </div>
            
            <div class="sidebar-footer">
                <p>Designed by Hassan Oubella</p>
                <p>© 2026 Epic Experiences Ltd.</p>
            </div>
        </aside>

        <!-- Top Action Bar -->
        <div class="top-actions">
            <button class="btn" id="btn-edit" data-action="toggleEditor">
                <span>✏️</span> Manage Slide
            </button>
            <button class="btn btn-primary" id="btn-present" data-action="togglePresentationMode">
                <span>🖥️</span> Present
            </button>
            <button class="btn" id="btn-print" data-action="print">
                <span>🖨️</span> Print PDF
            </button>
            <button class="btn theme-toggle" id="btn-theme" data-action="toggleTheme" title="Toggle Theme">
                🌙
            </button>
            <button class="btn" data-action="reload" title="Force reload latest app version">
                <span>🔄</span> Refresh App
            </button>
        </div>

        <!-- Main Slide Stage -->
        <main class="stage" id="stage">
            <div class="slide-deck" id="slide-deck">
                <!-- Slides loaded dynamically by JS -->
                
                <!-- Presenter Drawing Canvas & Laser Pointer -->
                <canvas id="markup-canvas"></canvas>
                <div id="laser-pointer"></div>
                
                <!-- Widescreen Progress timeline indicator -->
                <div class="progress-timeline">
                    <div class="progress-timeline-fill" id="pb-fill"></div>
                </div>
            </div>
            
            <!-- Draggable Presenter Notes Card Overlay -->
            <div class="presenter-notes-modal" id="notes-overlay">
                <div class="presenter-notes-title" id="notes-header">Presenter Notes</div>
                <div class="presenter-notes-content" id="notes-content">Slide speaking cues...</div>
            </div>
            
            <!-- Floating Navigation Controllers Overlay when Presenting -->
            <div class="floating-nav-overlay" id="floating-nav">
                <button class="float-nav-btn" data-action="prevSlide" title="Previous Slide">◀</button>
                <button class="float-nav-btn" id="btn-laser" data-action="toggleLaserPointer" title="Laser Pointer">🔴 Laser</button>
                <button class="float-nav-btn" id="btn-pen" data-action="togglePenTool" title="Markup Drawing Pen">✏️ Pen</button>
                <button class="float-nav-btn" data-action="clearCanvas" title="Clear Canvas Markup">🧹 Clear</button>
                <button class="float-nav-btn" id="btn-notes" data-action="toggleNotesOverlay" title="Presenter Notes">📝 Notes</button>
                <button class="float-nav-btn" data-action="nextSlide" title="Next Slide">▶</button>
                <button class="float-nav-btn" style="background-color: rgba(220, 53, 69, 0.85);" data-action="togglePresentationMode" title="Exit Presentation">✕</button>
            </div>
        </main>

        <!-- Keyboard Help -->
        <div class="controls-help">
            <span>Advance: <kbd>Space</kbd> / <kbd>→</kbd></span>
            <span>Back: <kbd>←</kbd></span>
            <span>Present: <kbd>F</kbd></span>
            <span>Close: <kbd>Esc</kbd></span>
        </div>

    </div>

    <!-- Add Slide Modal -->
    <div class="modal-overlay" id="add-slide-modal">
        <div class="modal-card">
            <h3 class="modal-title">Create New Slide</h3>
            <div class="editor-group">
                <label class="editor-label">Slide Title</label>
                <input type="text" class="editor-input" id="new-slide-title" placeholder="e.g. Sales Q3 Forecast">
            </div>
            <div class="editor-group">
                <label class="editor-label">Presenter / Speaker</label>
                <input type="text" class="editor-input" id="new-slide-speaker" placeholder="e.g. Alyssa">
            </div>
            <div class="editor-group">
                <label class="editor-label">Select Layout</label>
                <select class="editor-select" id="new-slide-layout">
                    <option value="cover">Title / Cover Slide</option>
                    <option value="agenda">Meeting Agenda Layout</option>
                    <option value="bullet-image" selected>Standard Split (Bullets + Image)</option>
                    <option value="quote">Editorial Quote Layout</option>
                    <option value="tech-layout">Technical Updates Layout</option>
                    <option value="feedback">Recognition / Value Card</option>
                </select>
            </div>
            <div class="editor-actions-row">
                <button class="editor-btn-sub" data-action="closeAddSlideModal">Cancel</button>
                <button class="btn btn-primary" style="padding: 8px 16px;" data-action="addNewSlide">Create Slide</button>
            </div>
        </div>
    <!-- Update Alert Banner -->
    <div id="update-banner" style="position: fixed; bottom: 25px; left: 50%; transform: translateX(-50%); background-color: var(--bg-sidebar); color: var(--text-on-sidebar); border: 1px solid var(--primary-light); padding: 14px 28px; border-radius: var(--radius-md); box-shadow: 0 12px 35px rgba(0,0,0,0.35); z-index: 10000; font-size: 13px; font-weight: 500; display: none; align-items: center; gap: 10px;">
        🚀 <span style="color: var(--primary-light);">New studio update deployed.</span> Reloading workspace to apply...
    </div>

    <!-- Reminders Modal -->
    <div class="modal-overlay" id="reminders-modal">
        <div class="modal-card" style="width: 500px; max-height: 90vh; overflow-y: auto;">
            <h3 class="modal-title" style="display:flex; align-items:center; gap:8px;">
                🔔 Teams Reminders & Scheduling
            </h3>
            
            <div class="editor-group">
                <label class="editor-label">MS Teams Webhook URL</label>
                <input type="text" class="editor-input" id="rem-webhook-url" placeholder="https://yourcompany.webhook.office.com/webhookb2/..." style="font-family: var(--font-mono); font-size:11px;">
            </div>

            <!-- List of Leaders with Emails and check boxes to nudge -->
            <div class="editor-group" style="border-top: 1px solid var(--border-color); margin-top:15px; padding-top:15px;">
                <label class="editor-label" style="margin-bottom:10px;">Leader Email Mapping & Nudge List</label>
                <div id="leaders-nudge-list" style="display:flex; flex-direction:column; gap:10px; max-height: 220px; overflow-y: auto; padding-right:5px; border: 1px solid var(--border-color); padding: 10px; border-radius: var(--radius-md); background: var(--bg-base);">
                    <!-- Generated dynamically by JS -->
                </div>
            </div>

            <!-- Schedule Auto Nudge -->
            <div class="editor-group" style="border-top: 1px solid var(--border-color); margin-top:15px; padding-top:15px;">
                <label class="editor-label">Schedule Automated Reminder</label>
                <div style="display:flex; gap:10px;">
                    <input type="datetime-local" class="editor-input" id="rem-schedule-time" style="flex:1;">
                    <button class="btn btn-primary" data-action="scheduleAutomatedReminder" style="padding: 8px 12px; font-size:12px; font-weight:600;">⏰ Schedule</button>
                </div>
                <div id="scheduled-reminders-list" style="font-size:11px; margin-top:10px; color: var(--text-secondary);">
                    <!-- List of active scheduled reminders -->
                </div>
            </div>

            <div class="editor-actions-row" style="margin-top:20px; border-top: 1px solid var(--border-color); padding-top:15px;">
                <button class="editor-btn-sub" data-action="closeRemindersModal">Close</button>
                <button class="btn btn-primary" style="background: #10b981; color: white;" data-action="sendInstantReminder">⚡ Send Nudge Now</button>
            </div>
        </div>
    </div>

    <!-- Slide Live Editor Side-Drawer -->
    <div class="editor-drawer" id="editor-drawer">
        <div class="editor-header">
            <h3 style="font-family: var(--font-serif); font-size: 22px;">Slide Settings</h3>
            <button class="btn" style="padding: 6px 12px;" data-action="toggleEditor">Close</button>
        </div>
        <div class="editor-body">
            <!-- Dynamic fields depending on active layout -->
            <div id="editor-fields-container"></div>
            
            <!-- Global Slide Reorder Controls -->
            <div class="editor-group" style="border-top: 1px solid var(--border-color); margin-top:20px; padding-top:15px;">
                <label class="editor-label">Reorder Slide</label>
                <div class="editor-actions-row">
                    <button class="editor-btn-sub" data-action="moveSlideUp">▲ Move Up</button>
                    <button class="editor-btn-sub" data-action="moveSlideDown">▼ Move Down</button>
                </div>
            </div>
            
            <div class="editor-group" style="margin-top:15px;">
                <button class="btn" style="width:100%; border-color:#ff8b8b; color:#ff8b8b; justify-content:center;" data-action="deleteActiveSlide">
                    🗑️ Delete Active Slide
                </button>
            </div>
        </div>
        <div style="margin-top:10px; border-top: 1px solid var(--border-color); padding-top:15px; text-align: center;">
            <div id="autosave-status" style="font-size: 11px; color: var(--text-sidebar-muted); font-weight: 500; display: flex; align-items: center; justify-content: center; gap: 6px;">
                <span style="color: #10b981;">●</span> Cloud Autosave Active
            </div>
        </div>
    </div>

    <!-- Supabase Client CDN Library -->
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>

    <script>
        const APP_VERSION = "1.0.9";

        // === SLIDES_DATA_START ===
        // Default PowerPoint slide state
        const defaultSlides = [
            {
                id: 'default-1',
                name: "Title / Cover",
                layout: "cover",
                speaker: "Team Leaders",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image4.jpeg",
                overlayImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image1.png",
                subtitle: "Epic Experiences Ltd.",
                title: "Monthly Progress Meeting",
                date: "July 2026",
                notes: "Welcome everyone to our monthly all-hands meeting. Today we are sharing progress updates from each team leader."
            },
            {
                id: 'default-2',
                name: "Meeting Agenda",
                layout: "agenda",
                speaker: "Tom",
                title: "Meeting Agenda & Order",
                subtitle: "agenda",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image5.jpeg",
                bullets: [
                    "Founder's note – Charlie",
                    "Performance & progress – Tom",
                    "Finance – Abdelilah",
                    "Product & comms – Nicole",
                    "Sales – Alyssa",
                    "Operations – Ivett",
                    "Business Development – Miguel",
                    "Brand & Innovation – Sara",
                    "Flashpack – Mel",
                    "Technology – Hassan",
                    "Feedback & Recognition"
                ],
                notes: "This is the order of presenters. We have a packed agenda today, so please keep your sections concise."
            },
            {
                id: 'default-3',
                name: "Founder's Note",
                layout: "quote",
                speaker: "Charlie",
                title: "Founder's note",
                subtitle: "Content",
                quote: "Setting the vision for this month: Refined focus on luxury concierges, strengthening relationships with our core suppliers, and launching Weave successfully.",
                author: "Charlie Shepherd, Founder",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image7.png",
                notes: "Setting the vision for this month: Refined focus on luxury concierges, strengthening relationships with our core suppliers, and launching Weave successfully."
            },
            {
                id: 'default-4',
                name: "Tom: Performance",
                layout: "bullet-image",
                speaker: "Tom",
                title: "PerformancE & progress",
                subtitle: "Performance",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image8.jpeg",
                bullets: [
                    "Strong commercial growth across core luxury experiences.",
                    "Enhanced conversion percentages on premium bespoke proposals.",
                    "Stabilized operations pipeline for autumn destination arrivals."
                ],
                notes: "Commercial numbers are looking strong. We are seeing a high booking percentage for bespoke autumn travel."
            },
            {
                id: 'default-5',
                name: "Abdelilah: Finance",
                layout: "bullet-image",
                speaker: "Abdelilah",
                title: "Finance update",
                subtitle: "Finance",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image11.jpeg",
                bullets: [
                    "Revenues are tracking successfully against the yearly forecast model.",
                    "Strong cash flow management and efficient transaction processing.",
                    "Automating operations and finance reporting within the new Weave ERP systems."
                ],
                notes: "Q2 and Q3 revenue tracking details. Cash flow is positive. ERP automation is reducing administrative friction."
            },
            {
                id: 'default-6',
                name: "Nicole: Product",
                layout: "bullet-image",
                speaker: "Nicole",
                title: "Product & comms update",
                subtitle: "Product & comms",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image12.jpeg",
                bullets: [
                    "Exceptional Black Tomato Q2 feedback.",
                    "Customer Experience: Shout out to the concierges.",
                    "Strengthening supplier relationships: Better commission, and customer benefits.",
                    "Challenge: Keep supplier consistency / social media updates.",
                    "Cross-department collaboration: Fam Trips, Premade Itineraries, Product Presentations (sharing knowledge), and Webinars."
                ],
                notes: "Concierges have been doing an outstanding job. Need to focus on maintaining consistent updates with key supplier rates."
            },
            {
                id: 'default-7',
                name: "Alyssa: Sales",
                layout: "bullet-image",
                speaker: "Alyssa",
                title: "Sales update",
                subtitle: "Sales",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image13.jpeg",
                bullets: [
                    "Significant improvement in Black Tomato conversion rate in comparison to 2025.",
                    "Progress updates on the high-profile 2027 Eclipse packages.",
                    "Challenge: Sales numbers and scaling/growth of the core advisory team."
                ],
                notes: "Highlight conversion metrics. Eclipse 2027 packages are already gaining high interest."
            },
            {
                id: 'default-8',
                name: "Ivett: Operations",
                layout: "bullet-image",
                speaker: "Ivett",
                title: "Operations update",
                subtitle: "Operations",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image14.avif",
                bullets: [
                    "Primary focus on Weave testing and modular workflow designs.",
                    "Collecting and consolidating 2027 destination rates from suppliers.",
                    "Finalizing logistics and autumn travel arrivals/check-ins."
                ],
                notes: "Supplier pricing collection deadlines. Weave testing is going smoothly."
            },
            {
                id: 'default-9',
                name: "Miguel: Bus Dev",
                layout: "bullet-image",
                speaker: "Miguel",
                title: "Business Development update",
                subtitle: "Business Development",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image15.png",
                bullets: [
                    "Travel Agency Partners: In-person meetings in London with Epic partners, and online meetings with Audley Travel.",
                    "Adventure DNA in Portugal: Presenting the 'Douro Kayak Adventure' project to bring our signature adventure DNA to Portugal.",
                    "FIFA World Cup 2030: Launching strategic planning and logistics preparation."
                ],
                notes: "Highlights of partner meetings in London. Portugal project updates. World Cup 2030 planning kick-off."
            },
            {
                id: 'default-10',
                name: "Sara: Brand & Innov",
                layout: "bullet-image",
                speaker: "Sara",
                title: "Brand & Innovation update",
                subtitle: "Brand & Innovation",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image16.jpeg",
                bullets: [
                    "Brand asset organisation: Designing the transitions after our designer moved to Granola.",
                    "Newsletter review: Analyzing past successes and planning mid-term content building on key learnings.",
                    "PR & Features: Finalizing the paid feature in The Telegraph Travel covering São Tomé & Príncipe.",
                    "Cross-Department: Working with Product on joined-up approaches: brand, product, communication, and sales."
                ],
                notes: "Transitioning brand asset workflows. The Telegraph travel feature is expected to publish soon."
            },
            {
                id: 'default-11',
                name: "Mel: Flashpack",
                layout: "bullet-image",
                speaker: "Mel",
                title: "Flashpack update",
                subtitle: "Flashpack",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image17.jpeg",
                bullets: [
                    "Quick high-level overview of the Flash Pack partnership structure.",
                    "Reviewing the 2026 results and volume generated so far.",
                    "Celebrating major wins for the month of July.",
                    "Navigating challenges and optimizing operations for next month."
                ],
                notes: "Review partnership metrics and growth targets for the remainder of 2026."
            },
            {
                id: 'default-12',
                name: "Hassan: Technology",
                layout: "tech-layout",
                speaker: "Hassan",
                title: "Technology update",
                subtitle: "Technology",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image18.png",
                bullets: [
                    "Weave is live and in testing, our new all-in-one business platform.",
                    "All core modules built: Sales, Operations, Finance, Resources...",
                    "Real data already flowing into Weave.",
                    "<strong>Challenges:</strong> Bugs being surfaced and fixed as the team tests; workflows still being refined based on early user feedback.",
                    "<strong>Support needed:</strong> Everyone: log in and actively test your module(s) before end of July. Flag bugs via the Weave chat.",
                    "<strong>What's next:</strong> Resolve outstanding bugs; Full company go-live in August 2026."
                ],
                notes: "Urge everyone to login and report any feedback/bugs by the end of July before standard production go-live."
            },
            {
                id: 'default-13',
                name: "Eva: Recognition",
                layout: "feedback",
                speaker: "Nicole & Sara",
                title: "Feedback & recognition",
                subtitle: "Recognition",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image19.jpeg",
                nominee: "Eva",
                nominator: "Nicole & Sara",
                detail: "Eva consistently brings a positive attitude to the team and is always willing to share her knowledge in a way that helps others feel more confident and informed. Her São Tomé and Príncipe presentation was particularly strong: it was clear, engaging and genuinely inspiring, and it helped the team better understand the destination and feel more prepared to sell it.",
                notes: "Huge shoutout to Eva for her destination training. Let's keep nominate team members for their outstanding contributions!"
            },
            {
                id: 'default-14',
                name: "Thank You / End",
                layout: "cover",
                speaker: "Team Leaders",
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image20.jpeg",
                overlayImage: "",
                subtitle: "Epic Experiences Ltd.",
                title: "Thank You",
                date: "Let's build something extraordinary together.",
                notes: "Thank you everyone! Open up the floor for Q&A."
            }
        ];
        // === SLIDES_DATA_END ===

        // Extracted assets gallery list
        const localImages = [
            { name: "image4.jpeg (Cover)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image4.jpeg" },
            { name: "image1.png (Title Logo)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image1.png" },
            { name: "image5.jpeg (Agenda)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image5.jpeg" },
            { name: "image7.png (Founder)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image7.png" },
            { name: "image8.jpeg (Tom)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image8.jpeg" },
            { name: "image11.jpeg (Finance)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image11.jpeg" },
            { name: "image12.jpeg (Product)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image12.jpeg" },
            { name: "image13.jpeg (Sales)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image13.jpeg" },
            { name: "image14.avif (Ops)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image14.avif" },
            { name: "image15.png (Miguel)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image15.png" },
            { name: "image16.jpeg (Sara)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image16.jpeg" },
            { name: "image17.jpeg (Mel)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image17.jpeg" },
            { name: "image18.png (Hassan)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image18.png" },
            { name: "image19.jpeg (Eva)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image19.jpeg" },
            { name: "image20.jpeg (End)", path: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image20.jpeg" }
        ];

        // === CONFIG_DATA_START ===
        // Theme and Font Preset Configuration
        let presentationConfig = {
            theme: 'luxury',
            font: 'serif'
        };
        // === CONFIG_DATA_END ===

        const themePresets = {
            luxury: {
                '--bg-base': '#fff9ef',
                '--bg-card': '#ffffff',
                '--text-primary': '#1d1b16',
                '--text-secondary': '#4e453b',
                '--primary': '#735a36',
                '--primary-light': '#c8a97e',
                '--border-color': 'rgba(127, 118, 106, 0.15)',
                '--shadow-ambient': '0 8px 30px rgba(42, 37, 32, 0.04)'
            },
            dark: {
                '--bg-base': '#0f131f',
                '--bg-card': '#1b1f2c',
                '--text-primary': '#dfe2f3',
                '--text-secondary': '#a0a8b9',
                '--primary': '#f59e0b',
                '--primary-light': '#ffc174',
                '--border-color': 'rgba(160, 142, 122, 0.15)',
                '--shadow-ambient': '0 12px 40px rgba(0, 0, 0, 0.4)'
            },
            ocean: {
                '--bg-base': '#0a192f',
                '--bg-card': '#112240',
                '--text-primary': '#ccd6f6',
                '--text-secondary': '#8892b0',
                '--primary': '#64ffda',
                '--primary-light': '#a5f3fc',
                '--border-color': 'rgba(100, 255, 218, 0.15)',
                '--shadow-ambient': '0 12px 45px rgba(10, 25, 47, 0.5)'
            },
            emerald: {
                '--bg-base': '#082f25',
                '--bg-card': '#022c22',
                '--text-primary': '#ecfdf5',
                '--text-secondary': '#a7f3d0',
                '--primary': '#10b981',
                '--primary-light': '#6ee7b7',
                '--border-color': 'rgba(16, 185, 129, 0.15)',
                '--shadow-ambient': '0 12px 45px rgba(2, 44, 34, 0.6)'
            }
        };

        const fontPresets = {
            serif: {
                '--font-serif': "'Newsreader', serif",
                '--font-sans': "'Inter', sans-serif"
            },
            sans: {
                '--font-serif': "'Inter', sans-serif",
                '--font-sans': "'Inter', sans-serif"
            },
            outfit: {
                '--font-serif': "Outfit, sans-serif",
                '--font-sans': "Outfit, sans-serif",
                '--font-mono': "Outfit, sans-serif"
            },
            mono: {
                '--font-serif': "'Inter', sans-serif",
                '--font-sans': "'JetBrains Mono', monospace"
            }
        };

        // App state
        let currentSlideIdx = 0;
        let slidesState = [];
        let isEditing = false;
        let isPresenting = false;

        // Presenter Tools variables
        let isLaserActive = false;
        let isPenActive = false;
        let isNotesOpen = false;
        let canvas, ctx;
        let isDrawing = false;
        let penColor = '#c8a97e';
        let penWidth = 4;

        // Supabase Collaboration Credentials
        const supabaseUrl = 'https://orfagnxsvrfebppqkulo.supabase.co';
        const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yZmFnbnhzdnJmZWJwcHFrdWxvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkzNTA2NDUsImV4cCI6MjA3NDkyNjY0NX0.8zLhuYjpntJnUuU2NRvY8uTxAQz2UrxZeOBzl2CTyAE';
        let supabaseClient = null;
        let dbLastUpdated = 0; // Prevent save/receive loops

        // Defensive localStorage wrapper — falls back to in-memory map if storage is blocked (Teams iframe)
        const _memStore = {};
        const safeStorage = {
            getItem(key) {
                try { return localStorage.getItem(key); } catch(e) { return _memStore[key] !== undefined ? _memStore[key] : null; }
            },
            setItem(key, value) {
                try { localStorage.setItem(key, value); } catch(e) { _memStore[key] = value; }
            }
        };

        // Startup Initialization
        window.addEventListener('DOMContentLoaded', () => {
            loadStoredConfig();
            loadStoredPresentation();
            initNavigation();
            renderAllSlides();
            setupKeyboardControls();
            setupFullscreenChangeListener();
            initCanvas();
            makeNotesDraggable();
            setupGlobalActionDelegate();
            setupStageDragDelegate();
            setupStageClickDelegate();
            
            // Connect to Supabase Cloud Database for real-time collaboration
            initSupabase();

            // Initialize auto-save event listeners
            initEditorAutoSave();
        });

        // Connect to Supabase Cloud Database for real-time collaboration
        async function initSupabase() {
            if (typeof supabase !== 'undefined') {
                try {
                    supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);
                    await syncFromSupabase();
                    subscribeToSupabase();
                } catch (e) {
                    console.warn("Supabase connection failed. Falling back to local offline storage.", e);
                }
            }
        }

        // Compare versions to detect codebase updates
        function checkForCodeUpdate(databaseVersion) {
            if (!databaseVersion) return false;
            
            if (databaseVersion !== APP_VERSION) {
                const localParts = APP_VERSION.split('.').map(Number);
                const dbParts = databaseVersion.split('.').map(Number);
                
                let isDbNewer = false;
                for (let i = 0; i < Math.max(localParts.length, dbParts.length); i++) {
                    const l = localParts[i] || 0;
                    const d = dbParts[i] || 0;
                    if (d > l) {
                        isDbNewer = true;
                        break;
                    }
                    if (l > d) {
                        break;
                    }
                }
                
                if (isDbNewer) {
                    const banner = document.getElementById('update-banner');
                    if (banner) {
                        banner.style.display = 'flex';
                    }
                    setTimeout(() => {
                        window.location.reload();
                    }, 2500);
                    return true;
                } else if (APP_VERSION !== databaseVersion) {
                    // Local code is newer, broadcast this update to database
                    presentationConfig.code_version = APP_VERSION;
                    saveToSupabase();
                }
            }
            return false;
        }

        // Fetch latest slide deck state from cloud
        async function syncFromSupabase() {
            if (!supabaseClient) return;
            try {
                const { data, error } = await supabaseClient
                    .from('presentation_slides')
                    .select('*')
                    .eq('key', 'epic-progress-deck')
                    .single();
                
                if (error && error.code === 'PGRST116') {
                    // Record doesn't exist yet, seed the database with defaults
                    const timestamp = new Date().toISOString();
                    presentationConfig.code_version = APP_VERSION;
                    const initialData = {
                        key: 'epic-progress-deck',
                        slides: defaultSlides,
                        config: presentationConfig,
                        updated_at: timestamp
                    };
                    const { error: insertError } = await supabaseClient
                        .from('presentation_slides')
                        .insert([initialData]);
                    
                    if (!insertError) {
                        slidesState = [...defaultSlides];
                        dbLastUpdated = new Date(timestamp).getTime();
                    }
                } else if (data) {
                    const dbVersion = data.config ? data.config.code_version : null;
                    if (checkForCodeUpdate(dbVersion)) {
                        return; // Stop rendering, reloading
                    }

                    const recordTime = new Date(data.updated_at).getTime();
                    if (recordTime > dbLastUpdated) {
                        dbLastUpdated = recordTime;
                        slidesState = data.slides;
                        presentationConfig = data.config;
                        
                        applyTheme(presentationConfig.theme);
                        applyFont(presentationConfig.font);
                        initNavigation();
                        goToSlide(currentSlideIdx);
                    }
                }
            } catch(e) {
                console.error("Supabase sync failed: ", e);
            }
        }

        // Save current modifications to cloud database
        async function saveToSupabase() {
            if (!supabaseClient) return;
            try {
                const timestamp = new Date().toISOString();
                presentationConfig.code_version = APP_VERSION;
                const { error } = await supabaseClient
                    .from('presentation_slides')
                    .update({
                        slides: slidesState,
                        config: presentationConfig,
                        updated_at: timestamp
                    })
                    .eq('key', 'epic-progress-deck');
                
                if (!error) {
                    dbLastUpdated = new Date(timestamp).getTime();
                } else {
                    console.error("Save to Supabase failed: ", error);
                }
            } catch (e) {
                console.error("Save to Supabase failed: ", e);
            }
        }

        // Realtime Subscription Listener (fires when colleagues update any slide)
        function subscribeToSupabase() {
            if (!supabaseClient) return;
            supabaseClient
                .channel('schema-db-changes')
                .on(
                    'postgres_changes',
                    { event: 'UPDATE', schema: 'public', table: 'presentation_slides', filter: 'key=eq.epic-progress-deck' },
                    (payload) => {
                        const newRecord = payload.new;
                        
                        const dbVersion = newRecord.config ? newRecord.config.code_version : null;
                        if (checkForCodeUpdate(dbVersion)) {
                            return; // Stop sync, reloading
                        }

                        const recordTime = new Date(newRecord.updated_at).getTime();
                        
                        // Only sync if the incoming database update is newer than our last actions
                        if (recordTime > dbLastUpdated) {
                            dbLastUpdated = recordTime;
                            slidesState = newRecord.slides;
                            presentationConfig = newRecord.config;
                            
                            applyTheme(presentationConfig.theme);
                            applyFont(presentationConfig.font);
                            initNavigation();
                            
                            // Re-render and keep slide active
                            const activeContainerIndex = currentSlideIdx;
                            renderAllSlides();
                            goToSlide(activeContainerIndex);
                        }
                    }
                )
                .subscribe();
        }

        // Load theme configuration
        function loadStoredConfig() {
            const stored = safeStorage.getItem('epic-presentation-config');
            if (stored) {
                try {
                    presentationConfig = JSON.parse(stored);
                } catch(e) {}
            }
            if (!presentationConfig.leader_emails) {
                presentationConfig.leader_emails = {};
            }
            if (!presentationConfig.teams_webhook_url) {
                presentationConfig.teams_webhook_url = "";
            }
            applyTheme(presentationConfig.theme);
            applyFont(presentationConfig.font);
        }

        // Apply theme colors
        function applyTheme(themeKey) {
            presentationConfig.theme = themeKey;
            const preset = themePresets[themeKey] || themePresets.luxury;
            for (const [property, value] of Object.entries(preset)) {
                document.documentElement.style.setProperty(property, value);
            }
            safeStorage.setItem('epic-presentation-config', JSON.stringify(presentationConfig));
            
            // Sync pen drawing color with the active theme primary accent
            penColor = preset['--primary-light'];
            
            // Sync config to cloud
            if (supabaseClient) {
                saveToSupabase();
            }
        }

        // Apply font typography
        function applyFont(fontKey) {
            presentationConfig.font = fontKey;
            const preset = fontPresets[fontKey] || fontPresets.serif;
            for (const [property, value] of Object.entries(preset)) {
                document.documentElement.style.setProperty(property, value);
            }
            safeStorage.setItem('epic-presentation-config', JSON.stringify(presentationConfig));
            
            // Sync config to cloud
            if (supabaseClient) {
                saveToSupabase();
            }
        }

        // Load presentation from LocalStorage
        function loadStoredPresentation() {
            const stored = safeStorage.getItem('epic-presentation-deck');
            if (stored) {
                try {
                    slidesState = JSON.parse(stored);
                } catch(e) {
                    slidesState = [...defaultSlides];
                }
            } else {
                slidesState = [...defaultSlides];
            }
        }

        // Save active state to LocalStorage and trigger Supabase Sync
        function savePresentationState() {
            safeStorage.setItem('epic-presentation-deck', JSON.stringify(slidesState));
            saveToSupabase();
        }

        // Initialize left sidebar list
        function initNavigation() {
            const list = document.getElementById('nav-list');
            list.innerHTML = "";
            slidesState.forEach((slide, idx) => {
                const li = document.createElement('li');
                li.className = `nav-item ${idx === currentSlideIdx ? 'active' : ''}`;
                li.setAttribute('draggable', 'true');
                li.innerHTML = `
                    <span class="nav-item-title">${slide.name}</span>
                    <button class="delete-slide-btn" data-delete-idx="${idx}">×</button>
                    <span class="nav-num">${String(idx + 1).padStart(2, '0')}</span>
                `;
                // Bind delete btn programmatically to avoid inline handlers (CSP)
                const deleteBtn = li.querySelector('.delete-slide-btn');
                if (deleteBtn) {
                    deleteBtn.addEventListener('click', (ev) => {
                        ev.stopPropagation();
                        deleteSlide(idx);
                    });
                }
                
                // Drag and Drop reordering handlers
                li.addEventListener('dragstart', (e) => {
                    e.dataTransfer.setData('text/plain', idx);
                    li.classList.add('dragging');
                });
                
                li.addEventListener('dragend', () => {
                    li.classList.remove('dragging');
                    document.querySelectorAll('.nav-item').forEach(el => el.classList.remove('drag-over'));
                });
                
                li.addEventListener('dragover', (e) => {
                    e.preventDefault();
                    li.classList.add('drag-over');
                });
                
                li.addEventListener('dragleave', () => {
                    li.classList.remove('drag-over');
                });
                
                li.addEventListener('drop', (e) => {
                    e.preventDefault();
                    li.classList.remove('drag-over');
                    const draggedIdx = parseInt(e.dataTransfer.getData('text/plain'));
                    if (!isNaN(draggedIdx) && draggedIdx !== idx) {
                        const [draggedSlide] = slidesState.splice(draggedIdx, 1);
                        slidesState.splice(idx, 0, draggedSlide);
                        currentSlideIdx = idx;
                        savePresentationState();
                        initNavigation();
                        renderAllSlides();
                    }
                });
                
                li.onclick = () => {
                    goToSlide(idx);
                };
                list.appendChild(li);
            });
        }

        // Change Slide function
        function goToSlide(idx) {
            if (idx < 0 || idx >= slidesState.length) return;
            currentSlideIdx = idx;
            
            // Toggle active classes on the slide containers in the DOM
            const containers = document.querySelectorAll('.slide-deck > .slide-container');
            containers.forEach((container, sIdx) => {
                if (sIdx === idx) {
                    container.classList.add('active');
                } else {
                    container.classList.remove('active');
                }
            });
            
            const navItems = document.querySelectorAll('.nav-item');
            navItems.forEach((item, navIdx) => {
                if (navIdx === currentSlideIdx) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });

            // Clear drawing canvas when moving slides
            clearCanvas();
            
            updateProgressBar();
            updatePresenterNotes();

            if (isEditing) {
                loadEditorFields();
            }
        }

        // Update progress bar width
        function updateProgressBar() {
            const fill = document.getElementById('pb-fill');
            if (fill && slidesState.length > 0) {
                const percentage = ((currentSlideIdx + 1) / slidesState.length) * 100;
                fill.style.width = percentage + '%';
            }
        }

        // Update presenter notes panel
        function updatePresenterNotes() {
            const content = document.getElementById('notes-content');
            if (content && slidesState.length > 0) {
                const notesText = slidesState[currentSlideIdx].notes || "No notes written for this slide.";
                content.innerText = notesText;
            }
        }

        // Navigate slides
        function nextSlide() {
            if (slidesState.length === 0) return;
            if (currentSlideIdx < slidesState.length - 1) {
                goToSlide(currentSlideIdx + 1);
            } else {
                goToSlide(0); // loop back
            }
        }

        function prevSlide() {
            if (slidesState.length === 0) return;
            if (currentSlideIdx > 0) {
                goToSlide(currentSlideIdx - 1);
            } else {
                goToSlide(slidesState.length - 1); // loop back
            }
        }

        // HTML escaping helper
        function escapeHtml(text) {
            if (!text) return "";
            return String(text)
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        // Rich formatter allowing basic markup + markdown bold
        function formatBulletText(text) {
            let escaped = escapeHtml(text);
            // Restore safe markup tags
            escaped = escaped.replace(/&lt;strong&gt;/g, '<strong>').replace(/&lt;\/strong&gt;/g, '</strong>')
                             .replace(/&lt;b&gt;/g, '<b>').replace(/&lt;\/b&gt;/g, '</b>')
                             .replace(/&lt;em&gt;/g, '<em>').replace(/&lt;\/em&gt;/g, '</em>')
                             .replace(/&lt;i&gt;/g, '<i>').replace(/&lt;\/i&gt;/g, '</i>');
            // Support Markdown **bold**
            escaped = escaped.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
            return escaped;
        }

        // Render all slides into the DOM
        function renderAllSlides() {
            const deck = document.getElementById('slide-deck');
            
            // Keep the canvas, laser, and progress bar DOM nodes
            const canvasNode = document.getElementById('markup-canvas');
            const laserNode = document.getElementById('laser-pointer');
            const pbNode = document.querySelector('.progress-timeline');
            
            deck.innerHTML = "";
            
            // Re-append key DOM nodes
            if (canvasNode) deck.appendChild(canvasNode);
            if (laserNode) deck.appendChild(laserNode);
            if (pbNode) deck.appendChild(pbNode);
            
            if (slidesState.length === 0) {
                const emptyMsg = document.createElement('div');
                emptyMsg.className = 'slide-container active';
                emptyMsg.style.cssText = 'text-align:center; display:flex; align-items:center; justify-content:center; flex-direction:column; height:100%;';
                emptyMsg.innerHTML = `
                    <h2 class="slide-title">No Slides Found</h2>
                    <button class="btn btn-primary" style="margin: 20px auto 0;" data-action="openAddSlideModal">Add a Slide</button>
                `;
                deck.appendChild(emptyMsg);
                return;
            }

            slidesState.forEach((slide, idx) => {
                const container = document.createElement('div');
                container.className = `slide-container ${idx === currentSlideIdx ? 'active' : ''}`;
                container.setAttribute('data-slide', idx + 1);

                let html = "";

                if (slide.layout === 'cover') {
                    if (slide.overlayImage) {
                        html = `
                            <div class="cover-slide-layout slide-drop-target">
                                <img src="${slide.bgImage}" class="cover-slide-bg" onerror="this.src='https://images.unsplash.com/photo-1539650116574-8efeb43e2750?q=80&w=1200';">
                                <div class="cover-slide-overlay">
                                    <img src="${slide.overlayImage}" class="cover-slide-title-img" onerror="this.style.display='none';">
                                </div>
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop background image here</div></div>
                            </div>
                        `;
                    } else {
                        html = `
                            <div class="slide-split-wrapper">
                                <div class="slide-text-pane" style="justify-content: center; width: 45%;">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Epic Experiences Ltd.'}</div>
                                    <h2 class="slide-heading-main" style="font-family: var(--font-serif); font-size: 52px; font-weight: 400; line-height: 1.1; margin-bottom: 20px;">
                                        ${slide.title || 'Title'}
                                    </h2>
                                    <p style="font-family: var(--font-serif); font-size: 20px; color: var(--primary-light); font-style: italic;">
                                        ${slide.date || ''}
                                    </p>
                                </div>
                                <div class="slide-image-pane slide-drop-target" style="width: 55%;">
                                    <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=800';">
                                    <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                                </div>
                            </div>
                        `;
                    }
                } else if (slide.layout === 'agenda') {
                    html = `
                        <div class="slide-split-wrapper">
                            <div class="slide-text-pane" style="width: 45%;">
                                <div class="slide-title-header">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Agenda'}</div>
                                    <h1 class="slide-heading-main"><span>Meeting Agenda</span> & Order</h1>
                                </div>
                                <ul class="slide-content-bullets" style="display: grid; grid-template-columns: 1fr; gap: 8px;">
                                    ${slide.bullets.map(b => `<li>${formatBulletText(b)}</li>`).join('')}
                                </ul>
                            </div>
                            <div class="slide-image-pane slide-drop-target" style="width: 55%;">
                                <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=800';">
                                <img src="https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image1.png" alt="Overlay Logo" style="position:absolute; bottom:25px; right:25px; height:24px; object-fit:contain; opacity:0.8; filter: drop-shadow(0 2px 4px rgba(0,0,0,0.2));">
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                            </div>
                        </div>
                    `;
                } else if (slide.layout === 'bullet-image') {
                    html = `
                        <div class="slide-split-wrapper">
                            <div class="slide-text-pane">
                                <div class="slide-title-header">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Updates'}</div>
                                    <h1 class="slide-heading-main">${slide.title || 'Update Slide'}</h1>
                                </div>
                                <ul class="slide-content-bullets">
                                    ${slide.bullets.map(b => `<li>${formatBulletText(b)}</li>`).join('')}
                                </ul>
                            </div>
                            <div class="slide-image-pane slide-drop-target">
                                <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=800';">
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                            </div>
                        </div>
                    `;
                } else if (slide.layout === 'quote') {
                    html = `
                        <div class="slide-split-wrapper">
                            <div class="slide-text-pane">
                                <div class="slide-title-header">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Introduction'}</div>
                                    <h1 class="slide-heading-main">${slide.title || 'Note'}</h1>
                                </div>
                                <div class="quote-container" style="text-align: left; padding: 20px 0; margin: 0;">
                                    <div class="quote-text" style="font-size: 22px; text-align: left; margin-bottom: 20px; line-height: 1.45;">
                                        "${slide.quote}"
                                    </div>
                                    <div class="quote-author">— ${slide.author || 'Speaker'}</div>
                                </div>
                            </div>
                            <div class="slide-image-pane slide-drop-target">
                                <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=800';">
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                            </div>
                        </div>
                    `;
                } else if (slide.layout === 'tech-layout') {
                    html = `
                        <div class="slide-split-wrapper">
                            <div class="slide-text-pane">
                                <div class="slide-title-header">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Roadmap'}</div>
                                    <h1 class="slide-heading-main">${slide.title || 'Platform Updates'}</h1>
                                </div>
                                <ul class="slide-content-bullets" style="font-size: 13.5px; gap: 8px;">
                                    ${slide.bullets.map(b => `<li>${formatBulletText(b)}</li>`).join('')}
                                </ul>
                            </div>
                            <div class="slide-image-pane slide-drop-target">
                                <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=800';">
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                            </div>
                        </div>
                    `;
                } else if (slide.layout === 'feedback') {
                    html = `
                        <div class="slide-split-wrapper">
                            <div class="slide-text-pane">
                                <div class="slide-title-header">
                                    <div class="slide-heading-subtitle">${slide.subtitle || 'Value Recognition'}</div>
                                    <h1 class="slide-heading-main">${slide.title || 'Value Card'}</h1>
                                </div>
                                <div class="quote-container" style="text-align: left; padding: 5px 0; max-width: 100%; margin: 0;">
                                    <h3 style="font-family: var(--font-serif); font-size: 24px; font-weight: 500; margin-bottom: 10px;">
                                        Nominated: <span>${slide.nominee || 'Name'}</span>
                                    </h3>
                                    <p style="font-family: var(--font-mono); font-size: 11px; color: var(--primary-light); margin-bottom: 12px;">
                                        Nominated by: <span>${slide.nominator || 'Speaker'}</span>
                                    </p>
                                    <div class="quote-text" style="font-size: 15px; text-align: left; line-height:1.55; margin-bottom: 10px; font-style: normal; color: var(--text-secondary);">
                                        "${slide.detail}"
                                    </div>
                                </div>
                            </div>
                            <div class="slide-image-pane slide-drop-target">
                                <img src="${slide.bgImage}" class="slide-full-bleed-image" onerror="this.src='https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=800';">
                                <div class="dropzone-overlay"><div class="dropzone-text">Drop image to change</div></div>
                            </div>
                        </div>
                    `;
                }

                container.innerHTML = html;
                deck.appendChild(container);
            });
            
            // Reinitialize canvas context sizes
            setTimeout(resizeCanvas, 50);
        }

        // Global Action Delegation — handles all data-action button clicks without inline handlers
        function setupGlobalActionDelegate() {
            document.addEventListener('click', (e) => {
                const btn = e.target.closest('[data-action]');
                if (!btn) return;
                const action = btn.getAttribute('data-action');
                switch (action) {
                    case 'toggleEditor':            toggleEditor(); break;
                    case 'togglePresentationMode':  togglePresentationMode(); break;
                    case 'print':                   exportPdf(); break;
                    case 'reload':                  window.location.reload(true); break;
                    case 'toggleTheme':             toggleTheme(); break;
                    case 'openAddSlideModal':       openAddSlideModal(); break;
                    case 'closeAddSlideModal':      closeAddSlideModal(); break;
                    case 'addNewSlide':             addNewSlide(); break;
                    case 'openRemindersModal':      openRemindersModal(); break;
                    case 'closeRemindersModal':     closeRemindersModal(); break;
                    case 'sendInstantReminder':     sendInstantReminder(); break;
                    case 'scheduleAutomatedReminder': scheduleAutomatedReminder(); break;
                    case 'resetToDefault':          resetToDefault(); break;
                    case 'moveSlideUp':             moveSlideUp(); break;
                    case 'moveSlideDown':           moveSlideDown(); break;
                    case 'deleteActiveSlide':       deleteActiveSlide(); break;
                    case 'prevSlide':               e.stopPropagation(); prevSlide(); break;
                    case 'nextSlide':               e.stopPropagation(); nextSlide(); break;
                    case 'toggleLaserPointer':      e.stopPropagation(); toggleLaserPointer(); break;
                    case 'togglePenTool':           e.stopPropagation(); togglePenTool(); break;
                    case 'clearCanvas':             e.stopPropagation(); clearCanvas(); break;
                    case 'toggleNotesOverlay':      e.stopPropagation(); toggleNotesOverlay(); break;
                }
            });
        }

        // Slide-deck level drag-drop delegation — replaces inline ondragover/ondrop on each pane
        function setupStageDragDelegate() {
            const deck = document.getElementById('slide-deck');
            if (!deck) return;

            deck.addEventListener('dragover', (e) => {
                const pane = e.target.closest('.slide-drop-target');
                if (!pane) return;
                e.preventDefault();
                e.stopPropagation();
                pane.classList.add('dragover');
            });

            deck.addEventListener('dragleave', (e) => {
                const pane = e.target.closest('.slide-drop-target');
                if (!pane) return;
                pane.classList.remove('dragover');
            });

            deck.addEventListener('drop', (e) => {
                const pane = e.target.closest('.slide-drop-target');
                if (!pane) return;
                e.preventDefault();
                e.stopPropagation();
                pane.classList.remove('dragover');

                const files = e.dataTransfer.files;
                if (files.length > 0) {
                    const file = files[0];
                    if (file.type.match('image.*')) {
                        const reader = new FileReader();
                        reader.onload = function(ev) {
                            slidesState[currentSlideIdx].bgImage = ev.target.result;
                            savePresentationState();
                            renderAllSlides();
                            if (isEditing) loadEditorFields();
                        };
                        reader.readAsDataURL(file);
                    }
                }
            });
        }

        // Stage click delegation — advances slide in presentation mode
        function setupStageClickDelegate() {
            const stage = document.getElementById('stage');
            if (!stage) return;
            stage.addEventListener('click', (event) => {
                if (isPresenting && !isPenActive
                    && !event.target.closest('.floating-nav-overlay')
                    && !event.target.closest('.presenter-notes-modal')) {
                    nextSlide();
                }
            });
        }

        // Open specific file selector trigger
        function triggerLocalFileSelect() {
            const input = document.createElement('input');
            input.type = 'file';
            input.accept = 'image/*';
            input.onchange = function(e) {
                const files = e.target.files;
                if (files.length > 0) {
                    const file = files[0];
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        const base64Data = event.target.result;
                        document.getElementById('edit-slide-bgimage').value = base64Data;
                        slidesState[currentSlideIdx].bgImage = base64Data;
                        savePresentationState();
                        renderAllSlides();
                        loadEditorFields();
                    };
                    reader.readAsDataURL(file);
                }
            };
            input.click();
        }

        // Toggle editor sidebar panel
        function toggleEditor() {
            const drawer = document.getElementById('editor-drawer');
            isEditing = !isEditing;
            
            if (isEditing) {
                drawer.classList.add('open');
                loadEditorFields();
            } else {
                drawer.classList.remove('open');
            }
        }

        // Populate editor fields based on layout
        function loadEditorFields() {
            const container = document.getElementById('editor-fields-container');
            container.innerHTML = "";
            
            if (slidesState.length === 0) return;
            const slide = slidesState[currentSlideIdx];

            // Render general settings (Name, Layout Type, Theme Customizers, Notes)
            let editorHtml = `
                <div class="editor-group" style="background-color: rgba(200, 169, 126, 0.08); padding: 12px; border-radius: var(--radius-md); border: 1px solid var(--border-color);">
                    <label class="editor-label" style="color: var(--primary);">Studio Theme Preset</label>
                    <select class="editor-select" style="margin-bottom: 8px;" id="ed-theme-select">
                        <option value="luxury" ${presentationConfig.theme === 'luxury' ? 'selected' : ''}>Quiet Luxury (Beige)</option>
                        <option value="dark" ${presentationConfig.theme === 'dark' ? 'selected' : ''}>Obsidian Dark (Indigo)</option>
                        <option value="ocean" ${presentationConfig.theme === 'ocean' ? 'selected' : ''}>Deep Ocean (Navy)</option>
                        <option value="emerald" ${presentationConfig.theme === 'emerald' ? 'selected' : ''}>Emerald Coast (Forest)</option>
                    </select>
                    
                    <label class="editor-label" style="color: var(--primary);">Typography Preset</label>
                    <select class="editor-select" id="ed-font-select">
                        <option value="serif" ${presentationConfig.font === 'serif' ? 'selected' : ''}>Editorial Serif (Newsreader)</option>
                        <option value="sans" ${presentationConfig.font === 'sans' ? 'selected' : ''}>Modern Clean (Inter)</option>
                        <option value="outfit" ${presentationConfig.font === 'outfit' ? 'selected' : ''}>Elegant Geometric (Outfit)</option>
                        <option value="mono" ${presentationConfig.font === 'mono' ? 'selected' : ''}>Industrial Coding (Mono)</option>
                    </select>
                </div>
                
                <div class="editor-group" style="margin-top: 15px;">
                    <label class="editor-label">Sidebar Navigation Name</label>
                    <input type="text" class="editor-input" id="edit-slide-name" value="${slide.name}">
                </div>
                <div class="editor-group">
                    <label class="editor-label">Slide Layout</label>
                    <select class="editor-select" id="edit-slide-layout">
                        <option value="cover" ${slide.layout === 'cover' ? 'selected' : ''}>Title / Cover Slide</option>
                        <option value="agenda" ${slide.layout === 'agenda' ? 'selected' : ''}>Meeting Agenda Layout</option>
                        <option value="bullet-image" ${slide.layout === 'bullet-image' ? 'selected' : ''}>Standard Split (Bullets + Image)</option>
                        <option value="quote" ${slide.layout === 'quote' ? 'selected' : ''}>Editorial Quote Layout</option>
                        <option value="tech-layout" ${slide.layout === 'tech-layout' ? 'selected' : ''}>Technical Updates Layout</option>
                        <option value="feedback" ${slide.layout === 'feedback' ? 'selected' : ''}>Recognition / Value Card</option>
                    </select>
                </div>
            `;

            // Layout-specific content inputs
            if (slide.layout === 'cover') {
                editorHtml += `
                    <div class="editor-group">
                        <label class="editor-label">Title</label>
                        <input type="text" class="editor-input" id="edit-slide-title" value="${slide.title || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Subtitle</label>
                        <input type="text" class="editor-input" id="edit-slide-subtitle" value="${slide.subtitle || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Metadata / Date</label>
                        <input type="text" class="editor-input" id="edit-slide-date" value="${slide.date || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Overlay Centered Image (Optional)</label>
                        <input type="text" class="editor-input" id="edit-slide-overlay" value="${slide.overlayImage || ''}">
                    </div>
                `;
            } else if (slide.layout === 'agenda' || slide.layout === 'bullet-image' || slide.layout === 'tech-layout') {
                editorHtml += `
                    <div class="editor-group">
                        <label class="editor-label">Section Tag / Subtitle</label>
                        <input type="text" class="editor-input" id="edit-slide-subtitle" value="${slide.subtitle || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Slide Main Title</label>
                        <input type="text" class="editor-input" id="edit-slide-title" value="${slide.title || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Speaker / Lead Name</label>
                        <input type="text" class="editor-input" id="edit-slide-speaker" value="${slide.speaker || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Bullet points (one per line)</label>
                        <textarea class="editor-textarea" id="edit-slide-bullets">${slide.bullets ? slide.bullets.join('\n') : ''}</textarea>
                    </div>
                `;
            } else if (slide.layout === 'quote') {
                editorHtml += `
                    <div class="editor-group">
                        <label class="editor-label">Section Subtitle</label>
                        <input type="text" class="editor-input" id="edit-slide-subtitle" value="${slide.subtitle || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Slide Main Title</label>
                        <input type="text" class="editor-input" id="edit-slide-title" value="${slide.title || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Quote text</label>
                        <textarea class="editor-textarea" id="edit-slide-quote">${slide.quote || ''}</textarea>
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Speaker Author Name</label>
                        <input type="text" class="editor-input" id="edit-slide-author" value="${slide.author || ''}">
                    </div>
                `;
            } else if (slide.layout === 'feedback') {
                editorHtml += `
                    <div class="editor-group">
                        <label class="editor-label">Slide Main Title</label>
                        <input type="text" class="editor-input" id="edit-slide-title" value="${slide.title || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Nominee Name</label>
                        <input type="text" class="editor-input" id="edit-slide-nominee" value="${slide.nominee || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Nominator Name(s)</label>
                        <input type="text" class="editor-input" id="edit-slide-nominator" value="${slide.nominator || ''}">
                    </div>
                    <div class="editor-group">
                        <label class="editor-label">Details / Contribution</label>
                        <textarea class="editor-textarea" id="edit-slide-detail">${slide.detail || ''}</textarea>
                    </div>
                `;
            }

            // Presenter Notes editor field
            editorHtml += `
                <div class="editor-group" style="border-top: 1px solid var(--border-color); margin-top:20px; padding-top:15px;">
                    <label class="editor-label" style="color: var(--primary);">Presenter Speaking Notes</label>
                    <textarea class="editor-textarea" id="edit-slide-notes" placeholder="Type talking points for this slide here...">${slide.notes || ''}</textarea>
                </div>
            `;

            // Image selection inputs & Upload triggers
            editorHtml += `
                <div class="editor-group" style="border-top: 1px solid var(--border-color); margin-top:20px; padding-top:15px;">
                    <label class="editor-label">Slide Image Path / Data URL</label>
                    <input type="text" class="editor-input" id="edit-slide-bgimage" value="${slide.bgImage || ''}">
                    
                    <div class="editor-drop-zone" id="editor-drop-zone-btn">
                        📂 Click to browse or Drag &amp; Drop image on the slide directly
                    </div>
                    
                    <div class="editor-label" style="margin-top: 12px; font-size:10px;">Or choose extracted asset:</div>
                    <div class="image-gallery" id="gallery-container"></div>
                </div>
            `;

            container.innerHTML = editorHtml;

            // ── Bind all editor events programmatically (no inline handlers = Teams CSP safe) ──
            const themeSelect = container.querySelector('#ed-theme-select');
            if (themeSelect) themeSelect.addEventListener('change', () => applyTheme(themeSelect.value));

            const fontSelect = container.querySelector('#ed-font-select');
            if (fontSelect) fontSelect.addEventListener('change', () => applyFont(fontSelect.value));

            const layoutSelect = container.querySelector('#edit-slide-layout');
            if (layoutSelect) layoutSelect.addEventListener('change', () => changeActiveSlideLayout(layoutSelect.value));

            const dropZoneBtn = container.querySelector('#editor-drop-zone-btn');
            if (dropZoneBtn) dropZoneBtn.addEventListener('click', () => triggerLocalFileSelect());

            loadGallery();
        }

        // Render dynamic image gallery
        function loadGallery() {
            const container = document.getElementById('gallery-container');
            if (!container) return;
            container.innerHTML = "";
            
            const activeSlide = slidesState[currentSlideIdx];

            localImages.forEach(img => {
                const imgEl = document.createElement('img');
                imgEl.className = 'gallery-img';
                imgEl.src = img.path;
                imgEl.alt = img.name;
                
                if (activeSlide.bgImage === img.path) {
                    imgEl.classList.add('selected');
                }

                imgEl.onclick = () => {
                    document.querySelectorAll('.gallery-img').forEach(i => i.classList.remove('selected'));
                    imgEl.classList.add('selected');
                    document.getElementById('edit-slide-bgimage').value = img.path;
                    slidesState[currentSlideIdx].bgImage = img.path;
                    savePresentationState();
                    renderAllSlides();
                };
                imgEl.onerror = () => {
                    imgEl.src = "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=150";
                };
                container.appendChild(imgEl);
            });
        }

        // Setup editor event delegation for auto-saving
        function initEditorAutoSave() {
            const container = document.getElementById('editor-fields-container');
            if (!container) return;
            
            let debounceTimer;
            
            // Listen to typing in inputs/textareas
            container.addEventListener('input', (e) => {
                const status = document.getElementById('autosave-status');
                if (status) {
                    status.innerHTML = '<span style="color: #f59e0b;">●</span> Syncing changes...';
                }
                
                clearTimeout(debounceTimer);
                debounceTimer = setTimeout(() => {
                    autoSaveChanges();
                }, 300); // 300ms debounce
            });

            // Listen to layout selection changes
            container.addEventListener('change', (e) => {
                if (e.target.id === 'edit-slide-layout') return; // Handled separately by changeActiveSlideLayout
                if (e.target.id === 'ed-theme-select') return;  // Handled by programmatic listener in loadEditorFields
                if (e.target.id === 'ed-font-select') return;   // Handled by programmatic listener in loadEditorFields
                autoSaveChanges();
            });
        }

        function autoSaveChanges() {
            if (slidesState.length === 0) return;
            const slide = slidesState[currentSlideIdx];

            const nameEl = document.getElementById('edit-slide-name');
            const bgImageEl = document.getElementById('edit-slide-bgimage');
            const notesEl = document.getElementById('edit-slide-notes');

            if (nameEl) slide.name = nameEl.value;
            if (bgImageEl) slide.bgImage = bgImageEl.value;
            if (notesEl) slide.notes = notesEl.value;

            if (slide.layout === 'cover') {
                const titleEl = document.getElementById('edit-slide-title');
                const subtitleEl = document.getElementById('edit-slide-subtitle');
                const dateEl = document.getElementById('edit-slide-date');
                const overlayEl = document.getElementById('edit-slide-overlay');
                
                if (titleEl) slide.title = titleEl.value;
                if (subtitleEl) slide.subtitle = subtitleEl.value;
                if (dateEl) slide.date = dateEl.value;
                if (overlayEl) slide.overlayImage = overlayEl.value;
            } else if (slide.layout === 'agenda' || slide.layout === 'bullet-image' || slide.layout === 'tech-layout') {
                const titleEl = document.getElementById('edit-slide-title');
                const subtitleEl = document.getElementById('edit-slide-subtitle');
                const speakerEl = document.getElementById('edit-slide-speaker');
                const bulletsEl = document.getElementById('edit-slide-bullets');
                
                if (titleEl) slide.title = titleEl.value;
                if (subtitleEl) slide.subtitle = subtitleEl.value;
                if (speakerEl) slide.speaker = speakerEl.value;
                if (bulletsEl) slide.bullets = bulletsEl.value.split('\n').filter(b => b.trim() !== "");
            } else if (slide.layout === 'quote') {
                const titleEl = document.getElementById('edit-slide-title');
                const subtitleEl = document.getElementById('edit-slide-subtitle');
                const quoteEl = document.getElementById('edit-slide-quote');
                const authorEl = document.getElementById('edit-slide-author');
                
                if (titleEl) slide.title = titleEl.value;
                if (subtitleEl) slide.subtitle = subtitleEl.value;
                if (quoteEl) slide.quote = quoteEl.value;
                if (authorEl) slide.author = authorEl.value;
            } else if (slide.layout === 'feedback') {
                const titleEl = document.getElementById('edit-slide-title');
                const nomineeEl = document.getElementById('edit-slide-nominee');
                const nominatorEl = document.getElementById('edit-slide-nominator');
                const detailEl = document.getElementById('edit-slide-detail');
                
                if (titleEl) slide.title = titleEl.value;
                if (nomineeEl) slide.nominee = nomineeEl.value;
                if (nominatorEl) slide.nominator = nominatorEl.value;
                if (detailEl) slide.detail = detailEl.value;
            }

            savePresentationState();
            initNavigation();
            renderAllSlides();
            updatePresenterNotes();
            
            const status = document.getElementById('autosave-status');
            if (status) {
                status.innerHTML = '<span style="color: #10b981;">●</span> Cloud Autosave Active';
            }
        }

        // Change layout type
        function changeActiveSlideLayout(newLayout) {
            slidesState[currentSlideIdx].layout = newLayout;
            
            if ((newLayout === 'agenda' || newLayout === 'bullet-image' || newLayout === 'tech-layout') && !slidesState[currentSlideIdx].bullets) {
                slidesState[currentSlideIdx].bullets = ["First point", "Second point"];
            } else if (newLayout === 'quote' && !slidesState[currentSlideIdx].quote) {
                slidesState[currentSlideIdx].quote = "Example quote text goes here.";
                slidesState[currentSlideIdx].author = "Author Name";
            } else if (newLayout === 'feedback' && !slidesState[currentSlideIdx].nominee) {
                slidesState[currentSlideIdx].nominee = "Eva";
                slidesState[currentSlideIdx].nominator = "Nicole & Sara";
                slidesState[currentSlideIdx].detail = "Detailed feedback text.";
            }

            renderAllSlides();
            loadEditorFields();
        }

        // Save active fields to LocalStorage & DOM
        function saveChanges() {
            if (slidesState.length === 0) return;
            const slide = slidesState[currentSlideIdx];

            slide.name = document.getElementById('edit-slide-name').value;
            slide.layout = document.getElementById('edit-slide-layout').value;
            slide.bgImage = document.getElementById('edit-slide-bgimage').value;
            slide.notes = document.getElementById('edit-slide-notes').value;

            if (slide.layout === 'cover') {
                slide.title = document.getElementById('edit-slide-title').value;
                slide.subtitle = document.getElementById('edit-slide-subtitle').value;
                slide.date = document.getElementById('edit-slide-date').value;
                slide.overlayImage = document.getElementById('edit-slide-overlay').value;
            } else if (slide.layout === 'agenda' || slide.layout === 'bullet-image' || slide.layout === 'tech-layout') {
                slide.title = document.getElementById('edit-slide-title').value;
                slide.subtitle = document.getElementById('edit-slide-subtitle').value;
                slide.speaker = document.getElementById('edit-slide-speaker').value;
                
                const bulletsText = document.getElementById('edit-slide-bullets').value;
                slide.bullets = bulletsText.split('\n').filter(b => b.trim() !== "");
            } else if (slide.layout === 'quote') {
                slide.title = document.getElementById('edit-slide-title').value;
                slide.subtitle = document.getElementById('edit-slide-subtitle').value;
                slide.quote = document.getElementById('edit-slide-quote').value;
                slide.author = document.getElementById('edit-slide-author').value;
            } else if (slide.layout === 'feedback') {
                slide.title = document.getElementById('edit-slide-title').value;
                slide.nominee = document.getElementById('edit-slide-nominee').value;
                slide.nominator = document.getElementById('edit-slide-nominator').value;
                slide.detail = document.getElementById('edit-slide-detail').value;
            }

            savePresentationState();
            initNavigation();
            renderAllSlides();
            updatePresenterNotes();
            showToast('✅ Presentation saved to cloud!', 'success');
        }

        // Delete active slide
        function deleteActiveSlide() {
            showConfirm('Are you sure you want to delete this slide?', () => {
                deleteSlide(currentSlideIdx);
                if (isEditing) toggleEditor();
            });
        }

        function deleteSlide(idx) {
            slidesState.splice(idx, 1);
            savePresentationState();
            
            if (currentSlideIdx >= slidesState.length) {
                currentSlideIdx = Math.max(0, slidesState.length - 1);
            }
            
            initNavigation();
            renderAllSlides();
        }

        // Move Slide Up
        function moveSlideUp() {
            if (currentSlideIdx === 0) return;
            swapSlides(currentSlideIdx, currentSlideIdx - 1);
        }

        // Move Slide Down
        function moveSlideDown() {
            if (currentSlideIdx === slidesState.length - 1) return;
            swapSlides(currentSlideIdx, currentSlideIdx + 1);
        }

        function swapSlides(fromIdx, toIdx) {
            const temp = slidesState[fromIdx];
            slidesState[fromIdx] = slidesState[toIdx];
            slidesState[toIdx] = temp;
            
            currentSlideIdx = toIdx;
            savePresentationState();
            initNavigation();
            renderAllSlides();
            loadEditorFields();
        }

        // Reset to default template
        function resetToDefault() {
            showConfirm('This will overwrite all customized slides with the default 14-slide template. Proceed?', () => {
                slidesState = JSON.parse(JSON.stringify(defaultSlides));
                currentSlideIdx = 0;
                savePresentationState();
                initNavigation();
                renderAllSlides();
                updateProgressBar();
                updatePresenterNotes();
                if (isEditing) loadEditorFields();
                showToast('🔄 Default template restored!', 'info');
            });
        }

        // Open Add Slide Modal
        function openAddSlideModal() {
            document.getElementById('new-slide-title').value = "";
            document.getElementById('new-slide-speaker').value = "";
            document.getElementById('add-slide-modal').classList.add('open');
        }

        function closeAddSlideModal() {
            document.getElementById('add-slide-modal').classList.remove('open');
        }

        // Create new slide
        function addNewSlide() {
            const title = document.getElementById('new-slide-title').value || "New Slide";
            const speaker = document.getElementById('new-slide-speaker').value || "Presenter";
            const layout = document.getElementById('new-slide-layout').value;
            
            const newSlide = {
                id: 'custom-' + Date.now(),
                name: title,
                layout: layout,
                speaker: speaker,
                title: title,
                subtitle: speaker,
                bgImage: "https://orfagnxsvrfebppqkulo.supabase.co/storage/v1/object/public/presentation-files/extracted_assets/image4.jpeg",
                notes: ""
            };

            if (layout === 'cover') {
                newSlide.overlayImage = "";
                newSlide.date = "";
            } else if (layout === 'agenda' || layout === 'bullet-image' || layout === 'tech-layout') {
                newSlide.bullets = ["Enter bullet point 1", "Enter bullet point 2"];
            } else if (layout === 'quote') {
                newSlide.quote = "Double-click to enter a quote.";
                newSlide.author = speaker;
            } else if (layout === 'feedback') {
                newSlide.nominee = "Eva";
                newSlide.nominator = speaker;
                newSlide.detail = "Contribution details...";
            }

            slidesState.splice(currentSlideIdx + 1, 0, newSlide);
            currentSlideIdx++;
            
            savePresentationState();
            closeAddSlideModal();
            initNavigation();
            goToSlide(currentSlideIdx);
        }

        // ── Custom Toast Notification (replaces alert()) ──
        function showToast(message, type) {
            type = type || 'info';
            let toast = document.getElementById('__epic-toast');
            if (!toast) {
                toast = document.createElement('div');
                toast.id = '__epic-toast';
                toast.style.cssText = [
                    'position:fixed', 'top:20px', 'left:50%', 'transform:translateX(-50%) translateY(-80px)',
                    'z-index:99999', 'padding:12px 24px', 'border-radius:10px', 'font-size:13px', 'font-weight:600',
                    'box-shadow:0 8px 30px rgba(0,0,0,0.35)', 'transition:transform 0.35s cubic-bezier(0.16,1,0.3,1)',
                    'pointer-events:none', 'white-space:nowrap'
                ].join(';');
                document.body.appendChild(toast);
            }
            const colors = {
                success: { bg: '#10b981', color: '#fff' },
                error:   { bg: '#ef4444', color: '#fff' },
                info:    { bg: 'var(--bg-sidebar)', color: 'var(--text-on-sidebar)' }
            };
            const c = colors[type] || colors.info;
            toast.style.backgroundColor = c.bg;
            toast.style.color = c.color;
            toast.textContent = message;
            toast.style.transform = 'translateX(-50%) translateY(0)';
            clearTimeout(toast._hideTimer);
            toast._hideTimer = setTimeout(() => {
                toast.style.transform = 'translateX(-50%) translateY(-80px)';
            }, 3000);
        }

        // ── Custom Confirm Modal (replaces confirm()) ──
        function showConfirm(message, onYes) {
            let overlay = document.getElementById('__epic-confirm');
            if (!overlay) {
                overlay = document.createElement('div');
                overlay.id = '__epic-confirm';
                overlay.style.cssText = [
                    'position:fixed', 'top:0', 'left:0', 'width:100vw', 'height:100vh',
                    'background:rgba(0,0,0,0.5)', 'display:flex', 'align-items:center',
                    'justify-content:center', 'z-index:100000', 'backdrop-filter:blur(4px)'
                ].join(';');
                overlay.innerHTML = `
                    <div style="background:var(--bg-card);border-radius:14px;padding:28px 32px;max-width:380px;width:90%;box-shadow:0 20px 60px rgba(0,0,0,0.4);">
                        <p id="__epic-confirm-msg" style="margin:0 0 22px;font-size:14px;line-height:1.55;color:var(--text-primary);"></p>
                        <div style="display:flex;gap:10px;justify-content:flex-end;">
                            <button id="__epic-confirm-no" style="padding:8px 18px;border-radius:8px;border:1px solid var(--border-color);background:transparent;color:var(--text-secondary);cursor:pointer;font-size:13px;">Cancel</button>
                            <button id="__epic-confirm-yes" style="padding:8px 18px;border-radius:8px;border:none;background:#ef4444;color:#fff;cursor:pointer;font-size:13px;font-weight:600;">Confirm</button>
                        </div>
                    </div>
                `;
                document.body.appendChild(overlay);
                overlay.querySelector('#__epic-confirm-no').addEventListener('click', () => { overlay.style.display = 'none'; });
                overlay.addEventListener('click', (ev) => { if (ev.target === overlay) overlay.style.display = 'none'; });
            }
            overlay.querySelector('#__epic-confirm-msg').textContent = message;
            overlay.style.display = 'flex';
            const yesBtn = overlay.querySelector('#__epic-confirm-yes');
            const newYes = yesBtn.cloneNode(true); // remove old listener
            yesBtn.replaceWith(newYes);
            newYes.addEventListener('click', () => {
                overlay.style.display = 'none';
                onYes();
            });
        }

        // Presenter Pen Markup drawing controls
        function initCanvas() {
            canvas = document.getElementById('markup-canvas');
            if (!canvas) return;
            ctx = canvas.getContext('2d');
            
            canvas.addEventListener('mousedown', startDrawing);
            canvas.addEventListener('mousemove', draw);
            canvas.addEventListener('mouseup', stopDrawing);
            canvas.addEventListener('mouseout', stopDrawing);
            
            window.addEventListener('resize', resizeCanvas);
        }

        function resizeCanvas() {
            if (!canvas || !canvas.offsetWidth) return;
            canvas.width = canvas.offsetWidth;
            canvas.height = canvas.offsetHeight;
            
            ctx.lineCap = 'round';
            ctx.lineJoin = 'round';
        }

        function startDrawing(e) {
            if (!isPenActive) return;
            isDrawing = true;
            const rect = canvas.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            ctx.beginPath();
            ctx.moveTo(x, y);
        }

        function draw(e) {
            if (!isDrawing || !isPenActive) return;
            const rect = canvas.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            ctx.lineTo(x, y);
            ctx.strokeStyle = penColor;
            ctx.lineWidth = penWidth;
            ctx.stroke();
        }

        function stopDrawing() {
            isDrawing = false;
        }

        function clearCanvas() {
            if (!ctx || !canvas) return;
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }

        // Toggle Laser Pointer
        function toggleLaserPointer() {
            isLaserActive = !isLaserActive;
            const btn = document.getElementById('btn-laser');
            const pointer = document.getElementById('laser-pointer');
            
            if (isLaserActive) {
                // Deactivate drawing pen
                if (isPenActive) togglePenTool();
                
                btn.classList.add('active');
                pointer.style.display = 'block';
                
                // Track mouse movement
                document.body.addEventListener('mousemove', updateLaserPosition);
            } else {
                btn.classList.remove('active');
                pointer.style.display = 'none';
                document.body.removeEventListener('mousemove', updateLaserPosition);
            }
        }

        function updateLaserPosition(e) {
            const pointer = document.getElementById('laser-pointer');
            const rect = document.getElementById('slide-deck').getBoundingClientRect();
            
            // Constrain laser within the slide boundaries
            const x = Math.max(rect.left, Math.min(rect.right, e.clientX)) - rect.left;
            const y = Math.max(rect.top, Math.min(rect.bottom, e.clientY)) - rect.top;
            
            pointer.style.left = x + 'px';
            pointer.style.top = y + 'px';
        }

        // Toggle Drawing Markup Pen
        function togglePenTool() {
            isPenActive = !isPenActive;
            const btn = document.getElementById('btn-pen');
            const canvasEl = document.getElementById('markup-canvas');
            
            if (isPenActive) {
                // Deactivate laser pointer
                if (isLaserActive) toggleLaserPointer();
                
                btn.classList.add('active');
                canvasEl.classList.add('active');
            } else {
                btn.classList.remove('active');
                canvasEl.classList.remove('active');
                stopDrawing();
            }
        }

        // Toggle Presenter Notes Overlay modal
        function toggleNotesOverlay() {
            isNotesOpen = !isNotesOpen;
            const btn = document.getElementById('btn-notes');
            const notes = document.getElementById('notes-overlay');
            
            if (isNotesOpen) {
                btn.classList.add('active');
                notes.style.display = 'block';
                updatePresenterNotes();
            } else {
                btn.classList.remove('active');
                notes.style.display = 'none';
            }
        }

        // Make the Presenter Notes modal draggable across the screen
        function makeNotesDraggable() {
            const modal = document.getElementById('notes-overlay');
            const header = document.getElementById('notes-header');
            if (!modal || !header) return;
            
            let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
            header.onmousedown = dragMouseDown;

            function dragMouseDown(e) {
                e.preventDefault();
                pos3 = e.clientX;
                pos4 = e.clientY;
                document.onmouseup = closeDragElement;
                document.onmousemove = elementDrag;
            }

            function elementDrag(e) {
                e.preventDefault();
                pos1 = pos3 - e.clientX;
                pos2 = pos4 - e.clientY;
                pos3 = e.clientX;
                pos4 = e.clientY;
                modal.style.top = (modal.offsetTop - pos2) + "px";
                modal.style.left = (modal.offsetLeft - pos1) + "px";
            }

            function closeDragElement() {
                document.onmouseup = null;
                document.onmousemove = null;
            }
        }

        // Keyboard Controls (Listen to WINDOW instead of document for fullscreen compatibility)
        function setupKeyboardControls() {
            window.addEventListener('keydown', (e) => {
                if (e.target.closest('input') || e.target.closest('textarea') || e.target.closest('select')) {
                    return;
                }

                const keysToHandle = ['Space', 'ArrowRight', 'ArrowLeft', 'ArrowUp', 'ArrowDown', 'PageDown', 'PageUp', 'Enter', 'KeyF', 'Escape', 'KeyL', 'KeyP', 'KeyN'];
                if (keysToHandle.includes(e.code)) {
                    if (isPresenting) {
                        e.preventDefault();
                    }
                    
                    if (e.code === 'Space' || e.code === 'ArrowRight' || e.code === 'ArrowDown' || e.code === 'PageDown' || e.code === 'Enter') {
                        nextSlide();
                    } else if (e.code === 'ArrowLeft' || e.code === 'ArrowUp' || e.code === 'PageUp') {
                        prevSlide();
                    } else if (e.code === 'KeyF') {
                        togglePresentationMode();
                    } else if (e.code === 'KeyL' && isPresenting) {
                        toggleLaserPointer();
                    } else if (e.code === 'KeyP' && isPresenting) {
                        togglePenTool();
                    } else if (e.code === 'KeyN' && isPresenting) {
                        toggleNotesOverlay();
                    } else if (e.code === 'Escape') {
                        if (isPresenting) togglePresentationMode();
                        if (isEditing) toggleEditor();
                    }
                }
            });
        }

        // Fullscreen Change Listener to capture browser native exits (like pressing Esc)
        function setupFullscreenChangeListener() {
            const handleFsChange = () => {
                const isFs = !!(document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement);
                if (!isFs && isPresenting) {
                    exitPresentationMode();
                }
            };
            document.addEventListener('fullscreenchange', handleFsChange);
            document.addEventListener('webkitfullscreenchange', handleFsChange);
            document.addEventListener('mozfullscreenchange', handleFsChange);
            document.addEventListener('MSFullscreenChange', handleFsChange);
        }

        // Toggle presentation mode wrapper called by both keyboard and action delegate
        function togglePresentationMode() {
            if (isPresenting) { exitPresentationMode(); } else { enterPresentationMode(); }
        }

        // Toggle presentation view
        function enterPresentationMode() {
            isPresenting = true;
            document.body.classList.add('presentation-mode');
            const btn = document.getElementById('btn-present');
            btn.innerHTML = '<span>❌</span> Exit Present';
            btn.classList.add('btn-primary');
            
            window.focus();
            
            // Clean up drawing state on launch
            clearCanvas();
            
            const target = document.getElementById('app-container');
            if (target.requestFullscreen) {
                target.requestFullscreen().catch(() => {});
            } else if (target.webkitRequestFullscreen) {
                target.webkitRequestFullscreen().catch(() => {});
            } else if (target.msRequestFullscreen) {
                target.msRequestFullscreen().catch(() => {});
            }
        }

        function exitPresentationMode() {
            isPresenting = false;
            document.body.classList.remove('presentation-mode');
            const btn = document.getElementById('btn-present');
            btn.innerHTML = '<span>🖥️</span> Present';
            btn.classList.remove('btn-primary');
            
            // Disable tools on exit
            if (isLaserActive) toggleLaserPointer();
            if (isPenActive) togglePenTool();
            if (isNotesOpen) toggleNotesOverlay();
            clearCanvas();
            
            const fsEl = document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement;
            if (fsEl) {
                if (document.exitFullscreen) {
                    document.exitFullscreen().catch(() => {});
                } else if (document.webkitExitFullscreen) {
                    document.webkitExitFullscreen().catch(() => {});
                } else if (document.mozCancelFullScreen) {
                    document.mozCancelFullScreen().catch(() => {});
                } else if (document.msExitFullscreen) {
                    document.msExitFullscreen().catch(() => {});
                }
            }
        }

        // Theme Toggle Function (Simple dark/light helper button)
        function toggleTheme() {
            const currentTheme = presentationConfig.theme;
            if (currentTheme === 'dark') {
                applyTheme('luxury');
                document.getElementById('btn-theme').innerHTML = '🌙';
            } else {
                applyTheme('dark');
                document.getElementById('btn-theme').innerHTML = '☀️';
            }
            if (isEditing) {
                loadEditorFields();
            }
            renderAllSlides();
        }

        // Export PDF — detects if running inside Teams (print is blocked) and guides the user
        function exportPdf() {
            // In Teams/iframe, window.print() is silently blocked
            const isInIframe = (() => { try { return window.self !== window.top; } catch(e) { return true; } })();
            if (isInIframe) {
                // Show the app URL and instruct user to open in browser for print
                const appUrl = 'https://oubellahassan.github.io/epic-slide-studio/';
                showToast('📤 Open app in browser to export PDF: ' + appUrl, 'info');
                // Also try to copy URL to clipboard
                if (navigator.clipboard && navigator.clipboard.writeText) {
                    navigator.clipboard.writeText(appUrl).catch(() => {});
                }
                return;
            }
            window.print();
        }

        // Open Reminders Modal
        function openRemindersModal() {
            document.getElementById('rem-webhook-url').value = presentationConfig.teams_webhook_url || "";
            
            // Generate list of unique slide leaders
            const nudgeList = document.getElementById('leaders-nudge-list');
            nudgeList.innerHTML = "";
            
            const uniqueLeaders = new Set();
            slidesState.forEach(slide => {
                if (slide.speaker && slide.speaker.trim() !== "" && slide.speaker !== "Team Leaders") {
                    const parts = slide.speaker.split(/ & | and |, /);
                    parts.forEach(p => {
                        const name = p.trim();
                        if (name !== "") uniqueLeaders.add(name);
                    });
                }
            });

            uniqueLeaders.forEach(leader => {
                const email = presentationConfig.leader_emails[leader] || (leader.toLowerCase().replace(/ /g, '') + "@epic.travel");
                
                // Detect completeness
                const leaderSlides = slidesState.filter(s => s.speaker && s.speaker.includes(leader));
                let isComplete = true;
                
                leaderSlides.forEach(slide => {
                    if (slide.layout === 'bullet-image' || slide.layout === 'agenda' || slide.layout === 'tech-layout') {
                        if (slide.bullets && (slide.bullets.includes("Enter bullet point 1") || slide.bullets.includes("First point") || slide.bullets.length === 0)) {
                            isComplete = false;
                        }
                    } else if (slide.layout === 'quote') {
                        if (slide.quote && (slide.quote.includes("Double-click") || slide.quote.includes("Example quote"))) {
                            isComplete = false;
                        }
                    } else if (slide.layout === 'feedback') {
                        if (slide.detail && (slide.detail.includes("details...") || slide.detail.includes("Detailed feedback"))) {
                            isComplete = false;
                        }
                    }
                });

                const row = document.createElement('div');
                row.style.cssText = "display: flex; align-items: center; justify-content: space-between; gap: 10px;";
                row.innerHTML = `
                    <div style="display:flex; align-items:center; gap:8px;">
                        <input type="checkbox" class="nudge-checkbox" value="${leader}" ${!isComplete ? 'checked' : ''} style="cursor:pointer; width:15px; height:15px;">
                        <span style="font-weight:600; font-size:12.5px; color: var(--text-primary);">${leader}</span>
                        ${!isComplete ? '<span style="font-size:9.5px; background:#f59e0b; color:white; padding:1px 5px; border-radius:10px; font-weight:700;">EMPTY</span>' : '<span style="font-size:9.5px; background:#10b981; color:white; padding:1px 5px; border-radius:10px; font-weight:700;">DONE</span>'}
                    </div>
                    <input type="email" class="editor-input leader-email-input" data-leader="${leader}" value="${email}" style="width: 220px; padding: 4px 8px; font-size:11.5px;" placeholder="Email address">
                `;
                nudgeList.appendChild(row);
            });

            renderScheduledReminders();
            document.getElementById('reminders-modal').classList.add('open');
        }

        function closeRemindersModal() {
            presentationConfig.teams_webhook_url = document.getElementById('rem-webhook-url').value.trim();
            
            document.querySelectorAll('.leader-email-input').forEach(input => {
                const leader = input.getAttribute('data-leader');
                presentationConfig.leader_emails[leader] = input.value.trim();
            });
            
            savePresentationState();
            document.getElementById('reminders-modal').classList.remove('open');
        }

        // Helper to compile Teams Adaptive Card
        function buildTeamsPayload(speakersToNudge, customMessage) {
            const mentionsText = speakersToNudge.map(s => `<at>${s.name}</at>`).join(', ');
            const entities = speakersToNudge.map(s => {
                return {
                    type: "mention",
                    text: `<at>${s.name}</at>`,
                    mentioned: {
                        id: s.email,
                        name: s.name
                    }
                };
            });

            return {
                type: "message",
                attachments: [
                    {
                        contentType: "application/vnd.microsoft.card.adaptive",
                        content: {
                            type: "AdaptiveCard",
                            body: [
                                {
                                    type: "TextBlock",
                                    text: "🔔 Epic Travel Slide Submission Nudge",
                                    weight: "bolder",
                                    size: "large",
                                    color: "accent"
                                },
                                {
                                    type: "TextBlock",
                                    text: customMessage || "It's time to prepare the Monthly Progress slide deck. Please update your slide.",
                                    wrap: true
                                },
                                {
                                    type: "TextBlock",
                                    text: `Paging: ${mentionsText}`,
                                    weight: "bolder",
                                    wrap: true
                                }
                            ],
                            msteams: {
                                entities: entities
                            },
                            actions: [
                                {
                                    type: "Action.OpenUrl",
                                    title: "Open Slide Studio",
                                    url: window.location.href.startsWith("http") ? window.location.href : "https://epic.travel"
                                }
                            ],
                            "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                            "version": "1.4"
                        }
                    }
                ]
            };
        }

        // Send instant notification via Webhook (Client-side POST)
        async function sendInstantReminder() {
            const webhookUrl = document.getElementById('rem-webhook-url').value.trim();
            if (!webhookUrl) {
                showToast('Please configure a valid MS Teams Webhook URL first.', 'error');
                return;
            }

            const checkedCheckboxes = document.querySelectorAll('.nudge-checkbox:checked');
            const speakersToNudge = [];
            checkedCheckboxes.forEach(cb => {
                const name = cb.value;
                const emailInput = document.querySelector(`.leader-email-input[data-leader="${name}"]`);
                const email = emailInput ? emailInput.value.trim() : (name.toLowerCase() + "@epic.travel");
                speakersToNudge.push({ name, email });
            });

            if (speakersToNudge.length === 0) {
                showToast('Please select at least one leader to nudge.', 'error');
                return;
            }

            const payload = buildTeamsPayload(speakersToNudge, "Hi everyone, please make sure your progress slides are filled in for the monthly meeting. Click below to edit.");

            try {
                const response = await fetch(webhookUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });
                
                if (response.ok) {
                    showToast('⚡ Nudge sent to Microsoft Teams!', 'success');
                } else {
                    showToast('Failed to send nudge. Verify Webhook URL.', 'error');
                }
            } catch (e) {
                console.error('Teams nudge failed:', e);
                showToast('Error sending nudge. Check console.', 'error');
            }
        }

        // Schedule server-side pg_cron/pg_net reminder via Supabase
        async function scheduleAutomatedReminder() {
            if (!supabaseClient) {
                showToast('Supabase connection required to schedule reminders.', 'error');
                return;
            }

            const webhookUrl = document.getElementById('rem-webhook-url').value.trim();
            const schedTimeStr = document.getElementById('rem-schedule-time').value;
            if (!webhookUrl || !schedTimeStr) {
                showToast('Please enter both Webhook URL and a schedule date/time.', 'error');
                return;
            }

            const checkedCheckboxes = document.querySelectorAll('.nudge-checkbox:checked');
            const speakersToNudge = [];
            checkedCheckboxes.forEach(cb => {
                const name = cb.value;
                const emailInput = document.querySelector(`.leader-email-input[data-leader="${name}"]`);
                const email = emailInput ? emailInput.value.trim() : (name.toLowerCase() + "@epic.travel");
                speakersToNudge.push({ name, email });
            });

            if (speakersToNudge.length === 0) {
                showToast('Please select at least one leader to schedule.', 'error');
                return;
            }

            const runAt = new Date(schedTimeStr).toISOString();
            const payload = buildTeamsPayload(speakersToNudge, "Automated Reminder: Monthly progress slides are due. Please complete yours before the meeting.");

            try {
                const { error } = await supabaseClient
                    .from('presentation_reminders')
                    .insert([{
                        run_at: runAt,
                        webhook_url: webhookUrl,
                        payload: payload,
                        completed: false
                    }]);
                
                if (!error) {
                    showToast('⏰ Reminder scheduled successfully!', 'success');
                    document.getElementById('rem-schedule-time').value = '';
                    renderScheduledReminders();
                } else {
                    showToast('Scheduling failed: ' + error.message, 'error');
                }
            } catch (e) {
                console.error('Scheduler failed:', e);
                showToast('Failed to connect to scheduler database.', 'error');
            }
        }

        // Render list of active/completed scheduled runs from Supabase
        async function renderScheduledReminders() {
            const listDiv = document.getElementById('scheduled-reminders-list');
            if (!listDiv || !supabaseClient) return;
            
            try {
                const { data, error } = await supabaseClient
                    .from('presentation_reminders')
                    .select('*')
                    .order('run_at', { ascending: true })
                    .limit(5);
                
                if (data && data.length > 0) {
                    let html = "<div style='font-weight:600; margin-top:8px; margin-bottom:5px;'>Active Scheduled Runs:</div>";
                    data.forEach(item => {
                        const localTime = new Date(item.run_at).toLocaleString();
                        html += `
                            <div style="display:flex; justify-content:space-between; align-items:center; background:rgba(0,0,0,0.15); padding: 4px 8px; border-radius: var(--radius-sm); margin-bottom:4px;">
                                <span>📅 ${localTime}</span>
                                ${item.completed ? '<span style="color:#10b981; font-weight:bold;">Sent ✓</span>' : '<span style="color:#f59e0b; font-weight:bold;">Pending ⏰</span>'}
                            </div>
                        `;
                    });
                    listDiv.innerHTML = html;
                } else {
                    listDiv.innerHTML = "No scheduled runs active.";
                }
            } catch(e) {}
        }
    </script>
</body>
</html>
