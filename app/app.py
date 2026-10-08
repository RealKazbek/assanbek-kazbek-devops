"""A small dependency-free HTTP application for the DevOps laboratory."""

import os
from http.server import BaseHTTPRequestHandler, HTTPServer


def student_data():
    """Return personalized values, allowing Docker/Jenkins environment overrides."""
    return {
        "name": os.getenv("STUDENT_NAME", "Kazbek"),
        "surname": os.getenv("STUDENT_SURNAME", "Assanbek"),
        "group": os.getenv("STUDENT_GROUP", "IT2-2302"),
        "id": os.getenv("STUDENT_ID", "37765"),
    }


def application_text():
    """Build the exact student application response."""
    student = student_data()
    return "\n".join(
        [
            "================================",
            "DevOps Student Application",
            "================================",
            f"Name: {student['name']}",
            f"Surname: {student['surname']}",
            f"Group: {student['group']}",
            f"Student ID: {student['id']}",
            "",
            "Application is running successfully!",
        ]
    ) + "\n"


class StudentHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path not in ("/", "/health"):
            self.send_error(404, "Not found")
            return
        body = "OK\n" if self.path == "/health" else application_text()
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body.encode())))
        self.end_headers()
        self.wfile.write(body.encode())

    def log_message(self, format_string, *args):
        print("HTTP %s - %s" % (self.address_string(), format_string % args), flush=True)


def main():
    port = int(os.getenv("APP_PORT", "8080"))
    print(application_text(), flush=True)
    print(f"Listening on port {port}", flush=True)
    HTTPServer(("0.0.0.0", port), StudentHandler).serve_forever()


if __name__ == "__main__":
    main()
