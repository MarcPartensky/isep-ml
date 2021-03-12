#!/usr/bin/env python
"""
Production wsgi server.
"""

from server import app

if __name__ == "__main__":
    app.run()
