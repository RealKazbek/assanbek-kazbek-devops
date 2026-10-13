import os
import threading
import unittest
from unittest.mock import patch
from urllib.error import HTTPError
from urllib.request import urlopen

from app.app import application_text, create_server, student_data


class StudentApplicationTests(unittest.TestCase):
    def test_default_student_data(self):
        with patch.dict(os.environ, {}, clear=True):
            self.assertEqual(
                student_data(),
                {"name": "Kazbek", "surname": "Assanbek", "group": "IT2-2302", "id": "37765"},
            )
            self.assertIn("Student ID: 37765", application_text())

    def test_environment_overrides_are_used(self):
        values = {
            "STUDENT_NAME": "Aruzhan",
            "STUDENT_SURNAME": "Test",
            "STUDENT_GROUP": "QA-1",
            "STUDENT_ID": "999",
        }
        with patch.dict(os.environ, values, clear=True):
            output = application_text()
            self.assertIn("Name: Aruzhan", output)
            self.assertIn("Surname: Test", output)
            self.assertIn("Group: QA-1", output)
            self.assertIn("Student ID: 999", output)

    def test_http_root_health_and_not_found(self):
        server = create_server(0)
        port = server.server_address[1]
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        try:
            with urlopen(f"http://127.0.0.1:{port}/", timeout=2) as response:
                body = response.read().decode()
                self.assertEqual(response.status, 200)
                self.assertIn("DevOps Student Application", body)
            with urlopen(f"http://127.0.0.1:{port}/health", timeout=2) as response:
                self.assertEqual(response.status, 200)
                self.assertEqual(response.read().decode(), "OK\n")
            with self.assertRaises(HTTPError) as error:
                urlopen(f"http://127.0.0.1:{port}/missing", timeout=2)
            self.assertEqual(error.exception.code, 404)
            error.exception.close()
        finally:
            server.shutdown()
            server.server_close()
            thread.join(timeout=2)


if __name__ == "__main__":
    unittest.main()
