from flask import Flask, jsonify


def create_app():
    """Create the Flask app."""
    
    app = Flask(__name__)
    
    
    @app.route('/health')
    def health_check():
        """Check if the application is up."""
        return jsonify({'success': 'app is up!'}), 200
    
    return app