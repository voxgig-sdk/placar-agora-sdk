# ProjectName SDK exists test

import pytest
from placaragora_sdk import PlacarAgoraSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = PlacarAgoraSDK.test(None, None)
        assert testsdk is not None
