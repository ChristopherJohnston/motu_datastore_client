"""
Tests for the datastore client module
"""
import unittest
import datetime
import pytest
from motu_datastore_client import DatastoreClient

class DatastoreClientTests(unittest.IsolatedAsyncioTestCase):
    def setUp(self):
        super().setUp()
        self.client = DatastoreClient("http://localhost:8888")

    @pytest.mark.asyncio
    async def test_generate_client_id(self):
        id = self.client.generate_client_id()
        self.assertLess(id, pow(2, 32))