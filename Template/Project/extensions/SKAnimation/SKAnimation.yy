{
    "id": "835bc135-9af7-4e4a-a1f4-ab05b9f04550",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "SKAnimation",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2019-53-13 08:01:28",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "9293ab7b-4f4f-4c18-bd0c-8934dbc6e711",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "efbf5e2b-32a2-6fd5-aa7d-17967de5c789",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATLAS_DEBUG_TEXTURE",
                    "hidden": false,
                    "value": "(1<<0) "
                },
                {
                    "id": "1a6db1b6-c73f-3f85-7858-f3fbb5843d7e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATLAS_DEBUG_REGIONS",
                    "hidden": false,
                    "value": "(1<<1) "
                },
                {
                    "id": "95477af4-12f7-9712-649c-28a7c924975b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATLAS_DEBUG_KEYS",
                    "hidden": false,
                    "value": "(1<<2) "
                },
                {
                    "id": "fcfc412d-5ea7-8b92-cb2d-5cc42675f649",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATLAS_DEBUG_ORIGINS",
                    "hidden": false,
                    "value": "(1<<3) "
                },
                {
                    "id": "8e3c284b-19d2-ce4d-297a-957926383f7e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_BONES",
                    "hidden": false,
                    "value": "(1<<0) "
                },
                {
                    "id": "c599f687-af47-783e-dc53-c5df38ee39f6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_INHERITANCE",
                    "hidden": false,
                    "value": "(1<<1) "
                },
                {
                    "id": "1ec3ae17-8c86-5aad-4f48-b22fb868d626",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_SIMPLE",
                    "hidden": false,
                    "value": "(1<<2) "
                },
                {
                    "id": "b6793524-1d41-4ab2-df1c-717222252bf9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_NAMES",
                    "hidden": false,
                    "value": "(1<<3) "
                },
                {
                    "id": "494d5fc8-af38-4d95-f95d-c4fdc3e5dca6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_VECTORS",
                    "hidden": false,
                    "value": "(1<<4) "
                },
                {
                    "id": "15df123b-bdfb-376e-19ac-a2dd265aff66",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_BAD_TRANSFORMS",
                    "hidden": false,
                    "value": "(1<<5) "
                },
                {
                    "id": "84d15195-b63a-fc58-8bcb-fe489a156943",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_EX_STRUCTURE",
                    "hidden": false,
                    "value": "(SK_BONE_DEBUG_BONES|SK_BONE_DEBUG_INHERITANCE|SK_BONE_DEBUG_VECTORS) "
                },
                {
                    "id": "15f1ffff-f498-8279-bc69-ad4789c51b73",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BONE_DEBUG_EX_DATA",
                    "hidden": false,
                    "value": "(SK_BONE_DEBUG_NAMES|SK_BONE_DEBUG_BAD_TRANSFORMS) "
                },
                {
                    "id": "12e2e5b2-e4c3-bcfa-29f8-9533522bcd3f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_NONE",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "e93214c4-f47c-8e25-1e66-b8f38fb88382",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_SCALE",
                    "hidden": false,
                    "value": "(1<<0) "
                },
                {
                    "id": "27935171-9e35-bff1-1836-ecf16e4c3fa2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_ROTATE",
                    "hidden": false,
                    "value": "(1<<1) "
                },
                {
                    "id": "f8a5a1ce-21ac-52b7-63f7-15456b67b8b7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_TRANSLATE",
                    "hidden": false,
                    "value": "(1<<2) \/* translate, skew, and reflection are passive flags meaning they are not required *\/ "
                },
                {
                    "id": "e738d816-e894-3a7e-8a8a-18f7d4cbe2eb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_SKEW",
                    "hidden": false,
                    "value": "(1<<3) \/* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) *\/ "
                },
                {
                    "id": "63aeeb52-7f9b-4e62-ec7f-e9515317c167",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_NORMAL",
                    "hidden": false,
                    "value": "(SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_ROTATE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW) "
                },
                {
                    "id": "c7e7beb8-3554-72b8-d667-6c7a25ec4a53",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_NOROTATION",
                    "hidden": false,
                    "value": "(SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW) "
                },
                {
                    "id": "7f743782-657d-988a-d2f3-877ba8fb21c6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_NOSCALE",
                    "hidden": false,
                    "value": "(SK_TRANSFORM_MODE_ROTATE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW) "
                },
                {
                    "id": "daf338c8-9aa9-a8f1-5ce3-2c8c58e46afa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_NOROTATIONORSCALE",
                    "hidden": false,
                    "value": "(SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW) "
                },
                {
                    "id": "6247a8b3-2387-8545-94d7-33d79167db27",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORM_MODE_EX_SPRITER",
                    "hidden": false,
                    "value": "(SK_TRANSFORM_MODE_NORMAL&(~SK_TRANSFORM_MODE_SKEW)) \/* spriter specific transformMode *\/ "
                },
                {
                    "id": "74cf8a7b-7bb8-347d-1471-8d84cf168846",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_NONE",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "7c5d9329-effc-68d4-395e-22b96f8f55af",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_LINEAR",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "d971e7f6-fbe5-2672-6f24-d3a3bf86176a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_IN",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "f5ea4b19-fd21-549d-149e-a7764aa8a292",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_OUT",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "4d5ba49b-6f63-d542-8351-514d6ca82a8c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_SMOOTHSTEP",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "2e43e5a5-9149-aea5-59fa-e64183164543",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_SMOOTHSTEP_INV",
                    "hidden": false,
                    "value": "5 "
                },
                {
                    "id": "e582f38f-fb65-9411-c34b-3b881a92f6fd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EASE_INSTANT",
                    "hidden": false,
                    "value": "6 "
                },
                {
                    "id": "2caac453-fd88-aa7d-5cb5-354d6deb44d6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BEND_POSITIVE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "236a3a27-1432-9713-5318-b6a7fcb5ef14",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_BEND_NEGATIVE",
                    "hidden": false,
                    "value": "-1 "
                },
                {
                    "id": "45542c26-7933-7d1b-43f5-c5df2f9de1a1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_OBJECT_DEBUG_ASSERTIONS_ENABLED",
                    "hidden": false,
                    "value": "true "
                },
                {
                    "id": "1d377d86-ba1b-22ad-872a-36fe57362ae3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "__SK_OBJECT_DEBUG_ASSERT_EXISTENCE",
                    "hidden": false,
                    "value": "if(SK_OBJECT_DEBUG_ASSERTIONS_ENABLED) then for(var __sk_voidPtr = [], __sk_assertion = __sk_voidPtr; __sk_assertion==__sk_voidPtr; __sk_assertion = __sk_assert_skeletonObjectDoesNotExistException(__sk_assertion)) var __sk_assertion "
                },
                {
                    "id": "c9842372-469c-79d3-7e2b-dc4cfc3f81e5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_MIX_BLEND",
                    "hidden": false,
                    "value": "0 \/* interpolates between the current pose and next pose *\/ "
                },
                {
                    "id": "f62c1f1f-6646-58e4-74a7-cdb27e4af9de",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_MIX_ADD",
                    "hidden": false,
                    "value": "1 \/* adds the next pose to the current pose *\/ "
                },
                {
                    "id": "ff8f3a7a-98d9-c4f8-156e-cda7381658d8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_MIX_OVERWRITE",
                    "hidden": false,
                    "value": "2 \/* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION *\/ "
                },
                {
                    "id": "436e55e9-38f6-9e49-8ce2-c2259734922a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ANIMATION_STATE",
                    "hidden": false,
                    "value": "\"animationState\" "
                },
                {
                    "id": "1b8a6784-a46d-bfcf-59e1-bd64f6659ace",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ANIMATION",
                    "hidden": false,
                    "value": "\"animation\" "
                },
                {
                    "id": "f6626365-679f-19d3-e62d-767ce44847fb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ANIMATION_MAINLINE_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "5fc72db3-dd4d-927b-9f27-ef97bb8f8bda",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ANIMATION_MAINLINE_TIMELINES",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "754a8bb8-5537-1ce3-d38e-fffbb9bb4da5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ANIMATION_MAINLINE_ENTRIES",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "e28b817b-49dc-8d42-1c25-a9a47a9b6f62",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ARMATURE",
                    "hidden": false,
                    "value": "\"armature\" "
                },
                {
                    "id": "f34a1326-271e-cacf-a86a-b1d75bc1d86a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ATLAS",
                    "hidden": false,
                    "value": "\"atlas\" "
                },
                {
                    "id": "3529e6e1-4a6e-d875-f33f-3cbea9eb7ba7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_INTERFACE_ATTACHMENT",
                    "hidden": false,
                    "value": "\"attachment\" "
                },
                {
                    "id": "c4b82ee3-218c-999b-89f4-de73debc4c61",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ATTACHMENT_TIMELINE",
                    "hidden": false,
                    "value": "\"attachment_timeline\" "
                },
                {
                    "id": "5cb78157-1528-d45a-a899-bd2c6ab4f1cf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATTACHMENT_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "2cc71254-86c3-9bbb-bb9f-ade3a7b2ad1b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATTACHMENT_KEYFRAME_KEY",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "9e97a5f2-ee4d-a6f5-3f97-82fff258363e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ATTACHMENT_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "3fba2f9b-aa27-1652-8251-5f8ae7267f7f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_BONE",
                    "hidden": false,
                    "value": "\"bone\" "
                },
                {
                    "id": "5cee7726-1812-a2d9-fd7c-ecbcb4dc5ef7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_COLOUR_TIMELINE",
                    "hidden": false,
                    "value": "\"colour_timeline\" "
                },
                {
                    "id": "52d68ded-a4cc-5cb5-2f8b-3b9ee43cb6ff",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_COLOUR_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "9c213af8-c8d9-fb1b-455e-1278c5b6ad8f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_COLOUR_KEYFRAME_COLOUR",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "a86f7f9e-d4e8-9327-ca85-7352d219d6df",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_COLOUR_KEYFRAME_ALPHA",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "d25233da-42c8-e7ee-3b9f-457589f767fa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_COLOUR_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "858958e4-7fec-1ccc-c56e-6bfa25111345",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_COLOUR_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "3fc5a4e2-c923-c9b8-1374-bb191315dfab",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_DRAW_ORDER_TIMELINE",
                    "hidden": false,
                    "value": "\"drawOrder_timeline\" "
                },
                {
                    "id": "3d984c1f-bbfd-1eea-638f-38cac1769173",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_DRAW_ORDER_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "ebbfd473-a33c-c49a-3221-b766b8134bc7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_DRAW_ORDER_KEYFRAME_TUPLE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "d5cf8f56-eb51-cdd3-da1a-3df6487da4cd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_DRAW_ORDER_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "5885f5b1-1229-2dda-baea-8ec2cc56ce91",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_EVENT",
                    "hidden": false,
                    "value": "\"event\" "
                },
                {
                    "id": "cf7457eb-5248-9bbb-5d62-9ee3b15b8f69",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_EVENT_TIMELINE",
                    "hidden": false,
                    "value": "\"event_timeline\" "
                },
                {
                    "id": "9a496bff-3a5d-29bc-f113-547f6321cc5d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "42b81625-25fa-9de7-319b-91b36e548898",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_DATA_BONE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "15514b74-71ed-eb84-49be-6bb4efa78841",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_DATA_STRING",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "7ed3df35-98b9-179b-981b-98ab85abc291",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_DATA_REAL",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "ddeec861-f83c-e775-a943-1ab2882e38ae",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_DATA_INT",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "ab35f95f-fdc9-5d1a-c8f5-a71f67a491a5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_DATA_SOUND",
                    "hidden": false,
                    "value": "5 "
                },
                {
                    "id": "5647571a-166e-4fb4-82d3-73cd8edafebb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_EVENT_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "6 "
                },
                {
                    "id": "3be5b6da-8c7e-9389-249c-32244b84481a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_IK_CONSTRAINT",
                    "hidden": false,
                    "value": "\"ik_constraint\" "
                },
                {
                    "id": "a5ae1bb6-edb8-4ba4-2ad3-d92b182e41ca",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_IK_TIMELINE",
                    "hidden": false,
                    "value": "\"ik_timeline\" "
                },
                {
                    "id": "32455ae7-86dd-2d4b-c136-6d1c637dec15",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_IK_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "2d5959a6-d28d-2c79-a466-931f882f31f1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_IK_KEYFRAME_BEND",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "e48afaeb-3e69-2e75-f115-7e3df4c5f2d7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_IK_KEYFRAME_WEIGHT",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "f28a44ff-1912-1868-64c2-d4be132f24b1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_IK_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "b5e8f9fb-cc37-dc7b-195d-b7ba42bf8cb6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_IK_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "88763116-d579-72b5-8d49-ed7afc553e1f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_PARENT_TIMELINE",
                    "hidden": false,
                    "value": "\"parent_timeline\" "
                },
                {
                    "id": "c9b49c69-9189-aa7f-3d45-5ce79f81efe6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_PARENT_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "e471532d-6b18-6cb4-7611-f7798913b461",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_PARENT_KEYFRAME_BONE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "653f177b-b2b6-acb9-a33d-a218237b6faa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_PARENT_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "88aeed7a-ff23-4d98-517b-53fdeb8ce8e9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_PHYSICS_CONSTRAINT",
                    "hidden": false,
                    "value": "\"physics_constraint\" "
                },
                {
                    "id": "bb9fac54-92ef-3679-bc6b-dc523ec53147",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_PLANE_ATTACHMENT",
                    "hidden": false,
                    "value": "\"plane_attachment\" "
                },
                {
                    "id": "7a73373f-e5cc-4985-52ae-345c69e61fdb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_POINT_ATTACHMENT",
                    "hidden": false,
                    "value": "\"point_attachment\" "
                },
                {
                    "id": "12198257-667a-7bf5-9df4-4e16e7b187e1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_INTERFACE_RENDERABLE",
                    "hidden": false,
                    "value": "\"renderable\" "
                },
                {
                    "id": "1df381b3-6f79-92e1-dcfc-d1b846a56d8c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_ROTATE_TIMELINE",
                    "hidden": false,
                    "value": "\"rotate_timeline\" "
                },
                {
                    "id": "baff1aaa-518a-b181-8b5a-fd6bb173a6da",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ROTATE_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "8691f136-a54d-9ced-16ab-9b67b5db3721",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ROTATE_KEYFRAME_ANGLE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "db866a9f-b864-3a5f-d992-7db5ae6fd378",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ROTATE_KEYFRAME_CYCLES",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "2772faef-e88c-7dcf-41dd-889c1aceaeeb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ROTATE_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "c7f2c66c-bf5a-4b96-ab2f-c22635aa6fcf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_ROTATE_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "26c9b121-8c7b-79db-93e8-1c9b7ab2193f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_SCALE_TIMELINE",
                    "hidden": false,
                    "value": "\"scale_timeline\" "
                },
                {
                    "id": "b2979145-ba93-f9a8-6517-4df468877244",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SCALE_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "c6fb69f1-b65e-c245-7e2d-5a984ad9ab23",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SCALE_KEYFRAME_X",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "ef98fe8b-dc6f-c6ba-2bbc-37819c5a6cf8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SCALE_KEYFRAME_Y",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "5b2d46e1-aa68-cc4f-e894-a7e7ab89a8f9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SCALE_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "954a3556-7af6-c81f-4264-bff3f5385551",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SCALE_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "19929df6-abdc-ad31-75bd-46cce4e66526",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_SHEAR_TIMELINE",
                    "hidden": false,
                    "value": "\"shear_timeline\" "
                },
                {
                    "id": "15c27617-a8aa-51dc-ed41-3d9ce674ad72",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHEAR_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "259cb294-eef1-a84a-27ae-7b7b575313ad",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHEAR_KEYFRAME_X",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "958227d4-da9f-9675-7f87-d49294537bbf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHEAR_KEYFRAME_Y",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "d253b8ef-c728-11a3-44ab-5b3819f4d9d3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHEAR_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "579e6bfe-332a-db1c-ff9c-d7583317224e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHEAR_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "7317f44b-6a67-1bbb-2ef9-5a386d2d3a1b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHIFT_BACK",
                    "hidden": false,
                    "value": "-9223372036854775808 \/* signed 64 bit integer limit (min) *\/ "
                },
                {
                    "id": "926c86cd-e87e-65e8-ee93-9ae216d6d662",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_SHIFT_FRONT",
                    "hidden": false,
                    "value": "9223372036854775807 \/* signed 64 bit integer limit (max) *\/ "
                },
                {
                    "id": "3e2eb8bd-2a12-ebba-ebe9-8abd99f3296a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_SKIN",
                    "hidden": false,
                    "value": "\"skin\" "
                },
                {
                    "id": "a71ead63-6cdf-664b-63be-32a47324da5d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_SLOT",
                    "hidden": false,
                    "value": "\"slot\" "
                },
                {
                    "id": "67bd3ab8-2c7b-d6c3-eeb3-52fcefd91c44",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_INTERFACE_TIMELINE",
                    "hidden": false,
                    "value": "\"timeline\" "
                },
                {
                    "id": "bbda4414-b583-336a-be65-e2d28be37456",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_TRANSFORMATION_CONSTRAINT",
                    "hidden": false,
                    "value": "\"transformation_constraint\" "
                },
                {
                    "id": "2117ae7f-a4c8-4e49-5c97-d46a94f326bc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_TRANSFORMATION_TIMELINE",
                    "hidden": false,
                    "value": "\"transformation_timeline\" "
                },
                {
                    "id": "13135e24-45cb-ff89-26c9-1dbf95a9e6ae",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "de6e4838-f54c-4961-88bb-74faeb96aa37",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "d2db5fc6-31dc-f1ea-de2e-eb72e479669c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_MIX_SCALE",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "a7196a26-553b-296e-a684-573f19e5edd8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "8ba96c5f-cceb-89d4-3baa-ac6cbaa83743",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "dc4b4a8c-f5ca-2485-ea34-bf3f534414f4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "5 "
                },
                {
                    "id": "258fc9e5-6b5b-ce89-5faf-86b34e798c15",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSFORMATION_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "6 "
                },
                {
                    "id": "b2381cb1-4b5c-8cf9-b8df-e43dead862ce",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TYPE_TRANSLATE_TIMELINE",
                    "hidden": false,
                    "value": "\"translate_timeline\" "
                },
                {
                    "id": "f1d4d9e9-1351-233e-8163-ccb9b321aa38",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSLATE_KEYFRAME_TIME",
                    "hidden": false,
                    "value": "0 "
                },
                {
                    "id": "7d2313c6-4c16-872f-35eb-268d24e43a8b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSLATE_KEYFRAME_X",
                    "hidden": false,
                    "value": "1 "
                },
                {
                    "id": "75c8af8f-351e-ab26-1218-b3a38be2e6df",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSLATE_KEYFRAME_Y",
                    "hidden": false,
                    "value": "2 "
                },
                {
                    "id": "5362943f-5a3b-673b-a38b-9a6445cca27e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSLATE_KEYFRAME_EASE",
                    "hidden": false,
                    "value": "3 "
                },
                {
                    "id": "9491a3ee-17eb-ac86-37f3-9ec6bd227261",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_TRANSLATE_KEYFRAME_ENTRIES",
                    "hidden": false,
                    "value": "4 "
                },
                {
                    "id": "9526c2f3-b9ff-6151-48f2-a5f471952bdc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "SK_INTERFACE_UPDATABLE",
                    "hidden": false,
                    "value": "\"updatable\" "
                }
            ],
            "copyToTargets": -1,
            "filename": "2DSKAnimation.gml",
            "final": "",
            "functions": [
                {
                    "id": "ffebf7e5-ca34-4ac2-b69e-e5967f72a770",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_animation",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_animation",
                    "returnType": 1
                },
                {
                    "id": "0c5b0b34-d22c-47c0-b351-f6bac87e03e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_bone",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_bone",
                    "returnType": 1
                },
                {
                    "id": "1e7e0e6d-4dc6-433e-a8c9-c631b3906334",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_event",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_event",
                    "returnType": 1
                },
                {
                    "id": "510e2720-4bb2-49e6-8fab-ac41d2bcc8eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_ik_constraint",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_ik_constraint",
                    "returnType": 1
                },
                {
                    "id": "d0b57373-206a-4faf-956f-21db0f1165fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_physics_constraint",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_physics_constraint",
                    "returnType": 1
                },
                {
                    "id": "283872d6-df90-4a21-b79d-568853f69737",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_plane_attachment",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_plane_attachment",
                    "returnType": 1
                },
                {
                    "id": "fb8387fd-dd16-4223-ae68-48d0b047e73b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_point_attachment",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_point_attachment",
                    "returnType": 1
                },
                {
                    "id": "3b451598-7849-433f-9806-4463d3ca2541",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_skin",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_skin",
                    "returnType": 1
                },
                {
                    "id": "ad858f8d-abaf-4be8-9aa8-9bbd97e70fb2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_slot",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_slot",
                    "returnType": 1
                },
                {
                    "id": "1cc04cba-46bd-44f6-aef1-cc478d412614",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ds_list_find_index_sk_transformation_constraint",
                    "help": "(id,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "ds_list_find_index_sk_transformation_constraint",
                    "returnType": 1
                },
                {
                    "id": "52162ab7-b3c7-4b76-b2f9-8c0c6849777c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_apply",
                    "help": "(animationState,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_apply",
                    "returnType": 1
                },
                {
                    "id": "3e5654ec-6140-40d2-b5a5-1e20c55ec6c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_clear",
                    "help": "(state,anim,loopTimes)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_clear",
                    "returnType": 1
                },
                {
                    "id": "85ade206-fec2-48be-a1a7-c9c4b86ffe85",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_create",
                    "help": "([armature])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_create",
                    "returnType": 1
                },
                {
                    "id": "243ab232-ec27-416e-8b7e-e1da7bb6b0e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_current_animation",
                    "help": "(state)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_current_animation",
                    "returnType": 1
                },
                {
                    "id": "5400f165-ab80-4b61-90a2-68c0a75ebf7f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_destroy",
                    "help": "(state)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_destroy",
                    "returnType": 1
                },
                {
                    "id": "fdbda533-c585-4108-91f4-3d7d544e5668",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_exists",
                    "help": "(state)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_exists",
                    "returnType": 1
                },
                {
                    "id": "30f2a2ae-bc32-4024-8457-b6c18ffcc9d1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_get_animations",
                    "help": "(state,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_get_animations",
                    "returnType": 1
                },
                {
                    "id": "60a07115-e982-4665-a62c-c9aed2a81da3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_get_mix",
                    "help": "(state,anim_from,anim_to)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_get_mix",
                    "returnType": 1
                },
                {
                    "id": "cacf1b63-b53e-4bbb-9033-aab268f324fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_play",
                    "help": "(state,anim,loopTimes)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_play",
                    "returnType": 1
                },
                {
                    "id": "fc834571-dbda-49de-9620-c3352b17d65e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_playing",
                    "help": "(state,anim)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_playing",
                    "returnType": 1
                },
                {
                    "id": "8e11d169-0f95-4b40-ba9c-1a0e88d4bafc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_set_animations",
                    "help": "(state,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_set_animations",
                    "returnType": 1
                },
                {
                    "id": "b37f4421-d4f2-4ba5-bacf-47fe11ee0cd1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_set_animations_armature",
                    "help": "(state,armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_set_animations_armature",
                    "returnType": 1
                },
                {
                    "id": "a17ce507-0f7c-4a63-9134-4a0d20d2704b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_set_defaultMix",
                    "help": "(state,amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_set_defaultMix",
                    "returnType": 1
                },
                {
                    "id": "045761c0-504d-4f44-8b52-1270e8a013f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_set_mix",
                    "help": "(state,anim_from,anim_to,amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_set_mix",
                    "returnType": 1
                },
                {
                    "id": "0352af9c-1008-4170-8b13-163359282ee8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_set_timescale",
                    "help": "(state,amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_set_timescale",
                    "returnType": 1
                },
                {
                    "id": "79f210bb-a469-456e-8fda-fb48f8dd74ef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animationState_update",
                    "help": "(animationState,timestep)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animationState_update",
                    "returnType": 1
                },
                {
                    "id": "1f2c41fb-9359-431d-95a3-e821d9fdb0fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_apply",
                    "help": "(animation,timeLast,time,mixPose,alpha,wrap,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_apply",
                    "returnType": 1
                },
                {
                    "id": "04e802aa-938d-47e6-bac5-585e87b91927",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_create",
                    "help": "(name,[duration,loop])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_create",
                    "returnType": 1
                },
                {
                    "id": "491dc2de-e03c-4376-9681-1b3ee64d6287",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_destroy",
                    "help": "(animation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_destroy",
                    "returnType": 1
                },
                {
                    "id": "8f74f087-51fd-4578-9eff-e29f0a3ff153",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_exists",
                    "help": "(animation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_exists",
                    "returnType": 1
                },
                {
                    "id": "20dd086a-fbe3-475d-ab86-ce928e98a084",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_get_duration",
                    "help": "(animation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_get_duration",
                    "returnType": 1
                },
                {
                    "id": "eb2041ba-e126-4c16-9750-26705b71afab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_get_name",
                    "help": "(animation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_get_name",
                    "returnType": 1
                },
                {
                    "id": "6819bb3f-fd29-4038-855b-281f51b5745f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_get_timelines",
                    "help": "(animation,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_get_timelines",
                    "returnType": 1
                },
                {
                    "id": "5fbeb563-6171-43e2-878b-1f91e61b5682",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_set_duration",
                    "help": "(animation,duration,loop)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_set_duration",
                    "returnType": 1
                },
                {
                    "id": "dad86a8f-137e-46d3-8fdf-321893eb96d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_set_name",
                    "help": "(animation,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_set_name",
                    "returnType": 1
                },
                {
                    "id": "d9953ba2-651d-46a4-8669-f3ecadb272bb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_set_timelines",
                    "help": "(animation,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_set_timelines",
                    "returnType": 1
                },
                {
                    "id": "5ccfd2b3-7473-41dd-a3bc-2f134cd5027e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_animation_update_mainline",
                    "help": "(animation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_animation_update_mainline",
                    "returnType": 1
                },
                {
                    "id": "b19d750d-fc7f-4cda-8921-af726e30102f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_create",
                    "help": "()",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_create",
                    "returnType": 1
                },
                {
                    "id": "dab6783f-6c97-4c05-96dd-291959315164",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_create_dragonbones",
                    "help": "(filepath,armature_name_or_id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_create_dragonbones",
                    "returnType": 1
                },
                {
                    "id": "d9b8a835-ab3a-4b2a-a6c0-53103092df7f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_create_dragonbones_context",
                    "help": "(json,armature_name_or_id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_create_dragonbones_context",
                    "returnType": 1
                },
                {
                    "id": "2f364305-26b7-47f1-94eb-eb407b43e51b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_create_spine",
                    "help": "(filepath)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_create_spine",
                    "returnType": 1
                },
                {
                    "id": "117d817c-446a-42b4-9873-e7e3f064761b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_create_spine_context",
                    "help": "(json)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_create_spine_context",
                    "returnType": 1
                },
                {
                    "id": "ed483838-61ff-4648-8b7f-9a52e2385325",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_destroy",
                    "help": "(armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_destroy",
                    "returnType": 1
                },
                {
                    "id": "19fd6077-e47f-46de-887b-38f347939f82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_draw_debug",
                    "help": "(armature,x,y,xscale,yscale,rotation,debugArgs)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_draw_debug",
                    "returnType": 1
                },
                {
                    "id": "3a5c7204-235a-4bff-9e31-553d97e53dfd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_exists",
                    "returnType": 1
                },
                {
                    "id": "8ce4cdd4-e07d-42d3-aff6-2fda5fe85c2a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_animations",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_animations",
                    "returnType": 1
                },
                {
                    "id": "928419ee-3b7c-4ad8-aac1-fc685fc1ea72",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_attachments",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_attachments",
                    "returnType": 1
                },
                {
                    "id": "1039651e-6a31-4f98-99b8-a6ab0cb84106",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_bones",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_bones",
                    "returnType": 1
                },
                {
                    "id": "e482ea87-89ce-4e65-8d7f-8b798101a5a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_constraints",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_constraints",
                    "returnType": 1
                },
                {
                    "id": "afdd3733-ff53-4429-80a4-49ca52e5d7d8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_drawOrder",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_drawOrder",
                    "returnType": 1
                },
                {
                    "id": "09de3c4b-eb0c-4ee6-bf89-5246395fd4a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_events",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_events",
                    "returnType": 1
                },
                {
                    "id": "b467e924-54ff-4c23-a6a5-7ee2302f25fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_skins",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_skins",
                    "returnType": 1
                },
                {
                    "id": "903a8e08-635c-4416-b30d-eced193c9471",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_slots",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_slots",
                    "returnType": 1
                },
                {
                    "id": "f09e2a40-dcae-4c28-9e29-a73e95a7ea41",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_get_updateOrder",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_get_updateOrder",
                    "returnType": 1
                },
                {
                    "id": "b7ae904b-661e-4e0c-a313-c7e620cc1913",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_pose_setup",
                    "help": "(armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_pose_setup",
                    "returnType": 1
                },
                {
                    "id": "c08a20ca-83f0-44be-916a-be734d8225db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_pose_update",
                    "help": "(armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_pose_update",
                    "returnType": 1
                },
                {
                    "id": "a9047721-8a1c-4744-8bcd-39f9646af0fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_pose_vertex_add",
                    "help": "(armature,vbuff)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_pose_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "43eeb7f5-2c15-49cd-9df6-0740a7274eec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_animations",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_animations",
                    "returnType": 1
                },
                {
                    "id": "6b1483fd-bf11-4542-bd30-1e23442af119",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_atlas",
                    "help": "(armature,atlas)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_atlas",
                    "returnType": 1
                },
                {
                    "id": "e23fea2a-a0b1-4ad8-862b-9650ce9744d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_attachments",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_attachments",
                    "returnType": 1
                },
                {
                    "id": "5efe5b73-e057-449f-a288-da9d881db26c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_bones",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_bones",
                    "returnType": 1
                },
                {
                    "id": "fab715cc-5376-4e14-a82e-abe9511204d8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_constraints",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_constraints",
                    "returnType": 1
                },
                {
                    "id": "8357f2da-2dfe-4cbf-a9e6-1fe6c31d25e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_default_skin",
                    "help": "(armature,skin_name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_default_skin",
                    "returnType": 1
                },
                {
                    "id": "f9f1d952-68fa-42e9-8595-3b0f3d68ec88",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_events",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_events",
                    "returnType": 1
                },
                {
                    "id": "96231bcd-05cf-4809-bd42-14c43d667a1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_skin",
                    "help": "(armature,[skin_name1,skin_name2,...])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_skin",
                    "returnType": 1
                },
                {
                    "id": "5a56cff0-3a46-42e0-a19e-89880e1d932b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_skins",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_skins",
                    "returnType": 1
                },
                {
                    "id": "06635ebd-f02b-4cef-a6df-fdf29bd39333",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_set_slots",
                    "help": "(armature,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_set_slots",
                    "returnType": 1
                },
                {
                    "id": "5f9aa7ea-33f6-454d-9805-9ca8af9194f7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_armature_update_cache",
                    "help": "(armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_armature_update_cache",
                    "returnType": 1
                },
                {
                    "id": "5eac5c75-58b7-42a2-a2e6-dad53e85484c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_add_region",
                    "help": "(atlas,key,u1,v1,u2,v2,ox,oy,w,h,rotation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_add_region",
                    "returnType": 1
                },
                {
                    "id": "8e8a9c65-34f1-4fb7-9610-a0c9ddfa095f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_add_region_direct",
                    "help": "(atlas,key,u1,v1,u2,v2,u3,v3,u4,v4,ox,oy,w,h)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_add_region_direct",
                    "returnType": 1
                },
                {
                    "id": "a4685690-4f08-449a-83a9-5f517784a126",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create",
                    "help": "([sprite,index])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create",
                    "returnType": 1
                },
                {
                    "id": "c538f008-f609-4f46-9454-fc49641dc8f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_dragonbones",
                    "help": "(filepath,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_dragonbones",
                    "returnType": 1
                },
                {
                    "id": "ea2a97c2-6e06-4c4f-867b-b74e1b8348c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_dragonbones_context",
                    "help": "(json,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_dragonbones_context",
                    "returnType": 1
                },
                {
                    "id": "771297d3-48bf-4598-b7c5-1ec345f8664f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_libgdx",
                    "help": "(filepath,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_libgdx",
                    "returnType": 1
                },
                {
                    "id": "57b550fc-2148-40ed-9290-085e45cb781f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_libgdx_context",
                    "help": "(libgdx,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_libgdx_context",
                    "returnType": 1
                },
                {
                    "id": "0fc7ab77-722f-4f23-9f93-8f3b508a0836",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_scon",
                    "help": "(filepath,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_scon",
                    "returnType": 1
                },
                {
                    "id": "ec5a6e17-c017-47e0-8ddf-c4e14c356c1b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_create_scon_context",
                    "help": "(json,sprite,subimg,scale)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_create_scon_context",
                    "returnType": 1
                },
                {
                    "id": "dc5f6434-959e-4348-94bf-9a38936468e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_destroy",
                    "help": "(atlas)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_destroy",
                    "returnType": 1
                },
                {
                    "id": "6f1fed77-4a94-4b5e-bdfe-a47a931b7596",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_draw_debug",
                    "help": "(atlas,x,y,w,h,debugArgs)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_draw_debug",
                    "returnType": 1
                },
                {
                    "id": "9bd2ccae-3793-4f82-a6b8-ca86dc0ddb41",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_exists",
                    "returnType": 1
                },
                {
                    "id": "96916ef9-114e-49b4-a1cf-b0ec002e681a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_get_region",
                    "help": "(atlas,key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_get_region",
                    "returnType": 1
                },
                {
                    "id": "a5e17d95-4897-48b8-8a8a-5f7b965ce1fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_get_texture",
                    "help": "(atlas)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_get_texture",
                    "returnType": 1
                },
                {
                    "id": "cd7dd14a-3f7b-456c-8279-0c73be6974a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_atlas_set_page",
                    "help": "(atlas,sprite,subimg)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_atlas_set_page",
                    "returnType": 1
                },
                {
                    "id": "4e083107-e4a7-42e3-aa1a-13d1bad04f82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_destroy",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_destroy",
                    "returnType": 1
                },
                {
                    "id": "7e067791-2191-4ef3-85c6-68a7627723d4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_exists",
                    "returnType": 1
                },
                {
                    "id": "162fe2f3-0019-48a1-b31d-2d786855b394",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "dc8b6040-b9c9-4534-8946-27328140aa67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_create",
                    "help": "([slot])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "5754a9f6-9a4c-46f6-a87e-d93e91460c4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "bf982c9a-0df4-4abf-86af-9efdbba3e0c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "fac1a214-d544-4cd4-b55b-6ad8a72fa1ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "a3b8f763-f306-4b9b-94ab-04dc6e58e691",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "f946c209-a7a8-44c1-8523-5f0a62c098fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "1fe7ec95-bc96-4c82-8c0f-dca90cc41028",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_timeline_set_slot",
                    "help": "(timeline,slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_timeline_set_slot",
                    "returnType": 1
                },
                {
                    "id": "f36da479-c175-4907-b0c8-eea044071f43",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_attachment_vertex_add",
                    "help": "(variable,vbuff,bone,colour,alpha)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_attachment_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "c5c361d1-96ed-4217-a75e-7624491a8a77",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_cache",
                    "help": "(bone,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_cache",
                    "returnType": 1
                },
                {
                    "id": "7140f2c7-54c4-4c38-8986-ed576cfa84a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_create",
                    "help": "(name,[parent],[length])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_create",
                    "returnType": 1
                },
                {
                    "id": "0c356386-a312-4655-9d71-4353759e12e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_destroy",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_destroy",
                    "returnType": 1
                },
                {
                    "id": "55c39d20-c2f3-4f9e-b4d3-47391f4c7c18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_draw_debug",
                    "help": "(bone,x,y,xscale,yscale,rotation,debugArgs)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_draw_debug",
                    "returnType": 1
                },
                {
                    "id": "7a6802ce-97e1-487a-8203-6fb4f2b9b6b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_exists",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_exists",
                    "returnType": 1
                },
                {
                    "id": "bc9a782c-de66-4539-ad12-6f855407bd5d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_length",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_length",
                    "returnType": 1
                },
                {
                    "id": "717c3345-8782-4787-b713-a37ca2f1d7b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_name",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_name",
                    "returnType": 1
                },
                {
                    "id": "4433896e-e8ae-418e-9e35-2de6dda12271",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_rotation",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_rotation",
                    "returnType": 1
                },
                {
                    "id": "86ec3c6d-7af6-412f-b8e9-6d8b322988da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_shear",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_shear",
                    "returnType": 1
                },
                {
                    "id": "e52511a1-3bc2-486d-8e6a-78a5ac1773b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_x",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_x",
                    "returnType": 1
                },
                {
                    "id": "92dd10f4-f8a5-47da-9df0-9e10128fd4b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_xscale",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_xscale",
                    "returnType": 1
                },
                {
                    "id": "86556d2a-fbee-47ce-bbe6-13eb8589de9e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_y",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_y",
                    "returnType": 1
                },
                {
                    "id": "b05de207-68fe-49b2-b08e-6708de4de637",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_get_yscale",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_get_yscale",
                    "returnType": 1
                },
                {
                    "id": "1396a5fc-f03f-4352-b9d4-541e9a27495c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_ik",
                    "help": "(bone,targetx,targety,alpha)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_ik",
                    "returnType": 1
                },
                {
                    "id": "e31e516c-8206-4831-a2c9-2761726e3b8b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_ik_chain",
                    "help": "(bone,targetx,targety,bendDir,alpha)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_ik_chain",
                    "returnType": 1
                },
                {
                    "id": "01b66a13-6bc0-44cb-b00b-5680b49d6136",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_interpolate_absolute_local",
                    "help": "(bone,target,xoffset,yoffset,xscaleoffset,yscaleoffset,yshearoffset,rotationoffset,translationMix,scaleMix,shearMix,rotationMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_interpolate_absolute_local",
                    "returnType": 1
                },
                {
                    "id": "118944cc-f7c4-4608-a2af-117f0a8b7453",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_interpolate_absolute_world",
                    "help": "(bone,target,xoffset,yoffset,xscaleoffset,yscaleoffset,yshearoffset,rotationoffset,translationMix,scaleMix,shearMix,rotationMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_interpolate_absolute_world",
                    "returnType": 1
                },
                {
                    "id": "c3a4c257-6ed7-4c3a-83be-8dd8f826e5e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_interpolate_relative_local",
                    "help": "(bone,target,xoffset,yoffset,xscaleoffset,yscaleoffset,yshearoffset,rotationoffset,translationMix,scaleMix,shearMix,rotationMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_interpolate_relative_local",
                    "returnType": 1
                },
                {
                    "id": "0faf57a2-40ff-48c8-80b6-cc42b4375de1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_interpolate_relative_world",
                    "help": "(bone,target,xoffset,yoffset,xscaleoffset,yscaleoffset,yshearoffset,rotationoffset,translationMix,scaleMix,shearMix,rotationMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_interpolate_relative_world",
                    "returnType": 1
                },
                {
                    "id": "2b725d90-ee4e-482d-a0e1-983130f7cf61",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_setup",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_setup",
                    "returnType": 1
                },
                {
                    "id": "6dd8539f-47e4-4a06-946e-f98e0640f7ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_set_length",
                    "help": "(bone,length)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_set_length",
                    "returnType": 1
                },
                {
                    "id": "b6c4bf4f-3f12-4e38-8a3c-4b7a902ff2f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_set_name",
                    "help": "(bone,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_set_name",
                    "returnType": 1
                },
                {
                    "id": "84d7c713-5e4f-4595-bd70-fc8e0549f7ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_set_parent",
                    "help": "(bone,parent)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_set_parent",
                    "returnType": 1
                },
                {
                    "id": "6e2be9bb-a445-4b5a-b5c1-5827a5d20992",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_set_pose",
                    "help": "(bone,x,y,xscale,yscale,xshear,yshear,rotation,transformMode)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_set_pose",
                    "returnType": 1
                },
                {
                    "id": "6a5d136f-210c-4459-94d4-8361a52617b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_set_pose_applied",
                    "help": "(bone,x,y,xscale,yscale,xshear,yshear,rotation,transformMode)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_set_pose_applied",
                    "returnType": 1
                },
                {
                    "id": "5f5d6993-236a-4177-bbab-1fcee911cfe3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_transform_position",
                    "help": "(bone,x,y)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_transform_position",
                    "returnType": 1
                },
                {
                    "id": "cb7f3793-9572-44fa-b3bf-b45d0fd542de",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_transform_rotation",
                    "help": "(bone,angle)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_transform_rotation",
                    "returnType": 1
                },
                {
                    "id": "904a4d84-6724-4868-98d7-09fd8ad6e0a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_update",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_update",
                    "returnType": 1
                },
                {
                    "id": "69bbccc0-1181-4f7e-8e89-d434bd89daa4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_update_applied",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_update_applied",
                    "returnType": 1
                },
                {
                    "id": "76b71759-10b2-49c7-abb8-648cd80b0b87",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_update_other",
                    "help": "(bone,parent)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_update_other",
                    "returnType": 1
                },
                {
                    "id": "dee8da6a-3300-4038-86d5-a9b6bafa7586",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_bone_update_other_applied",
                    "help": "(bone,parent)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_bone_update_other_applied",
                    "returnType": 1
                },
                {
                    "id": "8937e0d4-a77b-4ecb-b69b-a3721955b0c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "c85e344c-f9b6-42d0-8937-334215c1c0b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_create",
                    "help": "([slot])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "cebfbce0-c85b-448c-b95d-9e20a43709f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "5173e5ee-1e0d-45a6-a1eb-83aafd806c90",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "bdf18c5e-8eb1-400d-8546-006de4283818",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "2c9d551d-d820-42b4-9ea6-1ea247242d7e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "fd1ab7c5-2403-48c8-bf7a-7ed198de17b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "54e839a7-0e0f-4dd3-a609-d286a2e146ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_colour_timeline_set_slot",
                    "help": "(timeline,slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_colour_timeline_set_slot",
                    "returnType": 1
                },
                {
                    "id": "4edd6543-eea7-476b-b9cb-8af470ba4eb6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "b11f620d-c1f0-4fda-a3c5-e7330a2a0848",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_create",
                    "help": "([armature])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "5f936068-22c4-4180-a26e-df0a29370547",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "54162ac3-9646-4658-ab5d-51d984e3e94d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "6c7d4a43-d4e1-4ecc-b09a-e87ec57241bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "8e3f8740-c485-4179-b961-67279f871056",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "6da0504a-0d3c-4206-8831-8b06e476a063",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "d57428f3-865e-41b9-896a-1241042f26a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_set_target",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_set_target",
                    "returnType": 1
                },
                {
                    "id": "f4bb591c-ef74-4eb5-99c6-a614f87c01eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_drawOrder_timeline_set_target_armature",
                    "help": "(timeline,armature)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_drawOrder_timeline_set_target_armature",
                    "returnType": 1
                },
                {
                    "id": "34588b96-8746-418f-90a5-7a33f235f926",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ease",
                    "help": "(amount,ease)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ease",
                    "returnType": 1
                },
                {
                    "id": "7a180ec2-58f4-4dac-8d4c-3d82e4e003b2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ease_function_from_bezier",
                    "help": "(x1,y1,x2,y2)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ease_function_from_bezier",
                    "returnType": 1
                },
                {
                    "id": "1eb87c06-0df6-406e-8cc0-48b69688f581",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_create",
                    "help": "(name,[bone,string,real,int,sound])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_create",
                    "returnType": 1
                },
                {
                    "id": "bb9dbbec-cbe9-41be-9fe4-04a3dc38a1f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_destroy",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_destroy",
                    "returnType": 1
                },
                {
                    "id": "7ac8428f-8570-4db5-b423-6d7dfaffdc45",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_exists",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_exists",
                    "returnType": 1
                },
                {
                    "id": "d8b59f75-bb5f-47fe-98a5-059e81248977",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_bone",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_bone",
                    "returnType": 1
                },
                {
                    "id": "fd2e0241-2f96-4c33-8b07-4b8eaa56e088",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_int",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_int",
                    "returnType": 1
                },
                {
                    "id": "57067e36-17f0-4b9b-acf3-1d9798228869",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_name",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_name",
                    "returnType": 1
                },
                {
                    "id": "0fca413d-d6a9-4cce-aed6-ec8e90ef1c3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_real",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_real",
                    "returnType": 1
                },
                {
                    "id": "5821cccc-ed8f-4a83-954c-c8050742b347",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_sound",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_sound",
                    "returnType": 1
                },
                {
                    "id": "6caada18-2d37-46fb-b4db-339c8c6cbf15",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_get_string",
                    "help": "(event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_get_string",
                    "returnType": 1
                },
                {
                    "id": "16b68616-dbc7-4eb2-a526-6b4d6c3ffe93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_set_data",
                    "help": "(event,bone,string,real,int,sound)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_set_data",
                    "returnType": 1
                },
                {
                    "id": "d3706954-b366-438b-b44a-3a3d4292d030",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_set_data_applied",
                    "help": "(event,bone,string,real,int,sound)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_set_data_applied",
                    "returnType": 1
                },
                {
                    "id": "7381896c-8d18-43fb-af59-2ed59f9f66f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_set_name",
                    "help": "(event,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_set_name",
                    "returnType": 1
                },
                {
                    "id": "15202dbb-6d87-4b4b-b23d-60f9750dd880",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "adc1fc5f-6c20-44d9-b617-1895b62ac889",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_create",
                    "help": "([event])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "cef48b56-5650-49b5-bbb9-61ba1642b2e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "291c2f8c-bb5d-47c6-95fd-60f606239870",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "1efe28ae-0e6f-429b-b44b-29e18277d633",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "438a61be-b204-4260-82a2-452068cfc101",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "d9f0a59f-b970-40e8-a0b2-032228decaa5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_set_event",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_set_event",
                    "returnType": 1
                },
                {
                    "id": "6641865e-11a1-44e0-9e2e-d5b73e03e82b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_event_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_event_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "692c9f7d-80be-4a74-bd8a-1559e4bf4e66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_cache",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_cache",
                    "returnType": 1
                },
                {
                    "id": "79033ea1-e91a-42e6-9460-553c566a618a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_create",
                    "help": "(name,[joint,effector,chain])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_create",
                    "returnType": 1
                },
                {
                    "id": "4fb04cb8-b8fa-4f71-a36d-988614a19571",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_destroy",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_destroy",
                    "returnType": 1
                },
                {
                    "id": "75ee6e82-df50-4527-8ddd-27cf9aa591d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_exists",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_exists",
                    "returnType": 1
                },
                {
                    "id": "134cdad3-77c7-42ba-a998-333e9299502b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_get_name",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_get_name",
                    "returnType": 1
                },
                {
                    "id": "8ad025dc-d4e3-48c2-be65-e014fc70c34d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_setup",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_setup",
                    "returnType": 1
                },
                {
                    "id": "f4174f6e-3daa-4c70-a2ac-f512f244a692",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_set_bones",
                    "help": "(constraint,joint,target,chain)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_set_bones",
                    "returnType": 1
                },
                {
                    "id": "0aa251ba-936a-4368-8ec0-da2cae456a3e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_set_name",
                    "help": "(constraint,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_set_name",
                    "returnType": 1
                },
                {
                    "id": "8e1029ea-9883-4f88-ac18-b6c2aa4d0313",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_set_pose",
                    "help": "(constraint,bendDir,weight)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_set_pose",
                    "returnType": 1
                },
                {
                    "id": "fe01396f-35a9-4308-9780-fe5ca10be549",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_set_pose_applied",
                    "help": "(constraint,bendDir,weight)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_set_pose_applied",
                    "returnType": 1
                },
                {
                    "id": "23a6894d-7a5b-4197-812a-7944307951d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_constraint_update",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_constraint_update",
                    "returnType": 1
                },
                {
                    "id": "13114666-8675-4261-b327-569e652fbad5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "0a40c34c-161e-422a-9cfd-1d81af73cd65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_create",
                    "help": "([constraint])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "370927b5-dc69-4408-a322-edd34c203224",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "aeffe5c2-02a8-42af-a355-bda7e1fd4827",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "0fcb6273-e9ec-4092-81ca-1f86214ea303",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "29073515-a641-4fb0-9600-c46d23d8751a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "d23b03d9-82d4-43dd-803e-2c32e7d8796e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_set_constraint",
                    "help": "(timeline,constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_set_constraint",
                    "returnType": 1
                },
                {
                    "id": "18e6ac52-4824-4d76-9372-e3b5e4ff3326",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_ik_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_ik_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "a76f8550-58aa-478f-b0b4-0e3a0df1ce92",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_interface_script_get_index",
                    "help": "(interface,function)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_interface_script_get_index",
                    "returnType": 1
                },
                {
                    "id": "6cc50309-f8a6-401a-b244-e4041ec3d9ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_object_create",
                    "help": "(type,[interface])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_object_create",
                    "returnType": 1
                },
                {
                    "id": "dbd090e6-3e37-4e39-9f16-597908c802b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_object_destroy",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_object_destroy",
                    "returnType": 1
                },
                {
                    "id": "15fcdd0a-e15f-4660-92ef-3ea10c184253",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_object_exists",
                    "help": "(variable,[type],[interface])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_object_exists",
                    "returnType": 1
                },
                {
                    "id": "51426c18-9826-4299-96be-de3244293788",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_object_interface",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_object_interface",
                    "returnType": 1
                },
                {
                    "id": "43254774-d171-4b94-bd7d-ce3d1321a6a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_object_type",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_object_type",
                    "returnType": 1
                },
                {
                    "id": "6b95a3de-c49e-465d-83fc-2ee8e4bf4523",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "5dc1ea18-cfe7-431e-89c1-d9c86a3346dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_create",
                    "help": "([slot])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "1230ca83-2587-41a5-b795-1b75cfc77903",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "139d6846-796d-448c-9d2d-83bcd81ead7e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "fec89b83-848a-4289-9072-0d23c11f766d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "d6820ca1-e7d0-4091-bf08-78661fbc3aea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "4bc1053e-c123-4c61-bb98-0a865b173c92",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "8f862924-29c7-49ca-adfe-42f50d5ddb67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_parent_timeline_set_slot",
                    "help": "(timeline,slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_parent_timeline_set_slot",
                    "returnType": 1
                },
                {
                    "id": "4d33c531-972b-4933-83b8-91c24a1a3900",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_cache",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_cache",
                    "returnType": 1
                },
                {
                    "id": "82a36cbd-4cec-4f83-b357-7eb38d608a82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_create",
                    "help": "(name,[anchor,target])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_create",
                    "returnType": 1
                },
                {
                    "id": "5b4a4a4a-0b9d-4183-acc7-0e5ce1467c20",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_destroy",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_destroy",
                    "returnType": 1
                },
                {
                    "id": "a484b06e-8518-45f0-877b-daa44e6d80ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_exists",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_exists",
                    "returnType": 1
                },
                {
                    "id": "65a72094-bcaf-4a85-ba10-eaea0eaa3097",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_get_name",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_get_name",
                    "returnType": 1
                },
                {
                    "id": "20c454ac-e5b7-41cd-9ea4-bb1f4f25d489",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_get_system",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_get_system",
                    "returnType": 1
                },
                {
                    "id": "70b1950e-3c0b-4e03-8c26-5a56d95d85c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_setup",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_setup",
                    "returnType": 1
                },
                {
                    "id": "e132d0d7-2d9c-4834-9130-7dc8241cdaf1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_bones",
                    "help": "(constraint,anchor,effector)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_bones",
                    "returnType": 1
                },
                {
                    "id": "27b86856-7283-4ce2-9e35-1e3d06ce80b4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_name",
                    "help": "(constraint,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_name",
                    "returnType": 1
                },
                {
                    "id": "86e6e0f5-0628-4b04-b2c3-736bb3a0952d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_pose",
                    "help": "(constraint,gravity,dir,drive_amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_pose",
                    "returnType": 1
                },
                {
                    "id": "cfd3c6ea-8cd7-4812-9b93-b8cd022338ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_pose_applied",
                    "help": "(constraint,gravity,dir,drive_amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_pose_applied",
                    "returnType": 1
                },
                {
                    "id": "c6b1757a-f9aa-446a-80b7-3d61b3564969",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_rigid",
                    "help": "(constraint,enable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_rigid",
                    "returnType": 1
                },
                {
                    "id": "2ed21d76-e223-4afb-95c5-4570ed193198",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_set_system",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_set_system",
                    "returnType": 1
                },
                {
                    "id": "b2f58c9d-3366-43b9-9c99-91ccd760b20a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_constraint_update",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_constraint_update",
                    "returnType": 1
                },
                {
                    "id": "d95a6ef2-2846-4f6f-b8f1-f6b93d53629c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_environment_activate",
                    "help": "(id,dx,dy)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_environment_activate",
                    "returnType": 1
                },
                {
                    "id": "1ac58210-28b7-482f-87a1-fa5ca1d6758e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_environment_free",
                    "help": "(id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_environment_free",
                    "returnType": 1
                },
                {
                    "id": "f5e46aa3-99d9-48d2-a3e3-df734cc664c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_environment_set_drive",
                    "help": "(amount)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_environment_set_drive",
                    "returnType": 1
                },
                {
                    "id": "7bea64b1-87d4-40a0-a469-7bf97160514a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_physics_environment_set_gravity",
                    "help": "(gravity,direction)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_physics_environment_set_gravity",
                    "returnType": 1
                },
                {
                    "id": "bcfad138-8e86-4470-a986-d82d7ba3a89a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_create",
                    "help": "(name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_create",
                    "returnType": 1
                },
                {
                    "id": "eb952834-20cf-4262-8033-c4d4e3d803ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_destroy",
                    "help": "(bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_destroy",
                    "returnType": 1
                },
                {
                    "id": "8a39ee1b-4288-49d1-a645-44b3d4e82dbc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_exists",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_exists",
                    "returnType": 1
                },
                {
                    "id": "e80216b7-6c5c-4606-83d3-94450f282d1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_get_name",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_get_name",
                    "returnType": 1
                },
                {
                    "id": "0409bd98-be57-4e43-bdb2-b7a3ad382521",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_set_atlas",
                    "help": "(attachment,atlas)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_set_atlas",
                    "returnType": 1
                },
                {
                    "id": "808dffb5-7caa-4c3d-a992-b2f184fdf0d4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_set_matrix",
                    "help": "(attachment,x,y,xscale,yscale,xshear,yshear,rotation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_set_matrix",
                    "returnType": 1
                },
                {
                    "id": "56e6a405-f795-4b98-8b10-8173b9703042",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_set_name",
                    "help": "(attachment,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_set_name",
                    "returnType": 1
                },
                {
                    "id": "9126c755-4b92-4a0c-85e1-ae21af74d37b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_set_regionKey",
                    "help": "(attachment,key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_set_regionKey",
                    "returnType": 1
                },
                {
                    "id": "e41f14c2-257d-4800-bb60-8b2e4b05e7df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_plane_attachment_vertex_add",
                    "help": "(attachment,vbuff,bone,colour,alpha)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_plane_attachment_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "9877be2e-8e33-4b2e-bcb7-6f9e72d5c002",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_create",
                    "help": "(name,[x,y,rotation])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_create",
                    "returnType": 1
                },
                {
                    "id": "51a0a131-9f48-400c-b179-0f68792fbdff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_destroy",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_destroy",
                    "returnType": 1
                },
                {
                    "id": "050a5f71-69a7-4472-98fd-4bd7f08def25",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_exists",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_exists",
                    "returnType": 1
                },
                {
                    "id": "9e21f65d-846e-48fa-8fc4-4732f2531621",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_get_name",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_get_name",
                    "returnType": 1
                },
                {
                    "id": "23870b91-0e81-49b0-9c3a-008a498f5ae4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_get_rotation",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_get_rotation",
                    "returnType": 1
                },
                {
                    "id": "d1777401-e01b-4a96-900d-6668619b8678",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_get_x",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_get_x",
                    "returnType": 1
                },
                {
                    "id": "daaeefb4-c5c6-4ab4-80c0-bbb5fee9095e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_get_y",
                    "help": "(attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_get_y",
                    "returnType": 1
                },
                {
                    "id": "c95d8a6b-6fa4-43a2-8368-e0d00427dcdc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_set_name",
                    "help": "(attachment,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_set_name",
                    "returnType": 1
                },
                {
                    "id": "286b76c9-7a20-436d-a1af-d428c5d1dba8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_set_offsets",
                    "help": "(attachment,x,y,rotation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_set_offsets",
                    "returnType": 1
                },
                {
                    "id": "9b47df4f-35c4-4f92-8987-01f696f759dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_update",
                    "help": "(attachment,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_update",
                    "returnType": 1
                },
                {
                    "id": "f844a354-7e91-4c78-8a63-9e14d16dcb35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_point_attachment_vertex_add",
                    "help": "(attachment,vbuff,bone,colour,alpha)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_point_attachment_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "aa687de1-4ae5-4932-88a0-ee05ab1ff4e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_destroy",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_destroy",
                    "returnType": 1
                },
                {
                    "id": "8634381c-9d27-4044-a584-7668cb89d821",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_exists",
                    "returnType": 1
                },
                {
                    "id": "2c2fd7a6-c328-40dc-bcbc-a1fcc9164d98",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_get_attachments",
                    "help": "(variable,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_get_attachments",
                    "returnType": 1
                },
                {
                    "id": "0419d414-ac0e-4285-b05d-0f73080568a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_setup",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_setup",
                    "returnType": 1
                },
                {
                    "id": "feb7ea17-ec5d-4344-860b-40ee733e9de7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_set_attachments",
                    "help": "(variable,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_set_attachments",
                    "returnType": 1
                },
                {
                    "id": "a73f2285-8f22-46d9-9a7f-7162aba90e70",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_renderable_vertex_add",
                    "help": "(variable,vbuff)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_renderable_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "cf23baa6-c107-40f5-bfd6-d5b5c7dff263",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "61feb13f-63e5-4282-ad57-8bc2943a629b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_create",
                    "help": "([bone])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "5676f6d5-83a0-4560-a9dc-af0b80500bfd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "16e0e866-0fdc-4841-882f-9e67e6efa745",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "968c5b61-28ad-4647-9ac7-eb37b5ede723",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "43e05f8a-2f3b-4846-a6a7-5e13fdac0549",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "bce827fe-96a7-4597-961d-9f22de5388cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_set_bone",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_set_bone",
                    "returnType": 1
                },
                {
                    "id": "cfa23ad5-f357-4b25-ae09-0f96a5c36ff9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_rotate_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_rotate_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "b1b15162-e54f-4fd4-8bcc-e0895d939884",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "8bb915eb-420b-4e48-8ed0-aca18dd5d207",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_create",
                    "help": "([bone])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "0b9a0fda-6f64-42f2-8526-3f732977d8f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "894d8bef-8927-423a-a3fa-8d1fbfa6d933",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "c7f25be0-9885-43f9-8254-85a4566792d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "b88c82b8-6f54-4b55-8b22-a89107ac33b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "cfdb88f5-e6ca-4318-98e1-184c497f8200",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_set_bone",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_set_bone",
                    "returnType": 1
                },
                {
                    "id": "21c7aea2-4c3e-42a9-a96f-60c5752b8456",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_scale_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_scale_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "6382044e-7113-41ac-8df9-be2e5fafc376",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "0da3c88a-0ff7-4035-aaf2-ad0e6df5649f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_create",
                    "help": "([bone])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "a0094f65-9b84-43d9-8ca6-577ec860ce27",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "5f5a11cc-78d3-40a4-8c8c-eba10db0ab9b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "af2ff3ce-68e0-4e5e-9b03-d1c23fef6807",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "085a17c8-570d-4182-875e-96354505687c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "b1b2efed-9c09-4177-821c-3f945cffde09",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_set_bone",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_set_bone",
                    "returnType": 1
                },
                {
                    "id": "41934240-d01a-4f56-a55e-a6cca8c13bd7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_shear_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_shear_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "b55d1f02-7f2b-4f0e-82ec-a3380d8eec0b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_apply",
                    "help": "(skin,clear)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_apply",
                    "returnType": 1
                },
                {
                    "id": "53bdcccc-b6a0-424c-9aae-493c7a5cdb1d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_create",
                    "help": "(name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_create",
                    "returnType": 1
                },
                {
                    "id": "d1e3fa86-a37d-4489-a1e7-6aa88eec2ad0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_destroy",
                    "help": "(skin)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_destroy",
                    "returnType": 1
                },
                {
                    "id": "a17903e7-2b72-4d25-abbc-c654a4704c15",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_exists",
                    "help": "(skin)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_exists",
                    "returnType": 1
                },
                {
                    "id": "2ff50572-361e-40ca-a5ec-3fa23c55ea09",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_get_name",
                    "help": "(skin)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_get_name",
                    "returnType": 1
                },
                {
                    "id": "63415088-e3e6-45a5-bfb4-a47e11f3251e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_record_add",
                    "help": "(skin,slot,attachment,key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_record_add",
                    "returnType": 1
                },
                {
                    "id": "02222252-b1a1-4af2-a551-a3ced277a15d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_record_exists",
                    "help": "(skin,slot,key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_record_exists",
                    "returnType": 1
                },
                {
                    "id": "7c2969ad-2817-4235-9f79-239d89bf9d6f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_skin_set_name",
                    "help": "(skin,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_skin_set_name",
                    "returnType": 1
                },
                {
                    "id": "3714955f-107d-4df1-9804-1b6a0776f8a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_attachment_get_key",
                    "help": "(slot,attachment)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_attachment_get_key",
                    "returnType": 1
                },
                {
                    "id": "6110a385-a2c9-4567-a976-a90b754c176b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_create",
                    "help": "(name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_create",
                    "returnType": 1
                },
                {
                    "id": "d5fb118c-89b9-4afd-822e-fcda97b31f52",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_destroy",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_destroy",
                    "returnType": 1
                },
                {
                    "id": "e8615203-e97a-4e27-8eea-481a5f62c195",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_exists",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_exists",
                    "returnType": 1
                },
                {
                    "id": "7b1aad88-8e25-4072-a724-18d88a3d6642",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_alpha",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_alpha",
                    "returnType": 1
                },
                {
                    "id": "348c2176-0f42-4dee-8800-0c9f301b0a85",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_attachment",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_attachment",
                    "returnType": 1
                },
                {
                    "id": "576f5094-3cea-4834-9db6-ac40546401bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_attachments",
                    "help": "(slot,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_attachments",
                    "returnType": 1
                },
                {
                    "id": "5d6d9429-66d5-419a-8ad8-7d6a2b00e12d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_bone",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_bone",
                    "returnType": 1
                },
                {
                    "id": "1918b1a9-62cc-4085-a8be-25ba2b47ee39",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_colour",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_colour",
                    "returnType": 1
                },
                {
                    "id": "8ed756ea-e821-419a-8ad2-4a0910ae2445",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_get_name",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_get_name",
                    "returnType": 1
                },
                {
                    "id": "45c5ea6e-58c4-4372-a78e-696b27951d56",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_setup",
                    "help": "(slot)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_setup",
                    "returnType": 1
                },
                {
                    "id": "32b50a8b-e984-4db8-b76d-a1951bad046c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_set_attachments",
                    "help": "(slot,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_set_attachments",
                    "returnType": 1
                },
                {
                    "id": "2dafb285-f186-44ff-ac9d-847830e82b2e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_set_name",
                    "help": "(slot,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_set_name",
                    "returnType": 1
                },
                {
                    "id": "3a20b053-698a-4a8b-9610-a812917e07b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_set_pose",
                    "help": "(slot,colour,alpha,bone,attachment_or_key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_set_pose",
                    "returnType": 1
                },
                {
                    "id": "7fdab28f-6efe-4569-a7c5-8be12bb7541f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_set_pose_applied",
                    "help": "(slot,colour,alpha,bone,attachment_or_key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_set_pose_applied",
                    "returnType": 1
                },
                {
                    "id": "915304ab-4b2f-4dee-8402-1a8b3bfbd022",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_slot_vertex_add",
                    "help": "(slot,vbuff)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_slot_vertex_add",
                    "returnType": 1
                },
                {
                    "id": "78c3b2b0-6947-452d-ace5-20f076cf71ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_timeline_apply",
                    "help": "(variable,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "7ae8acef-cf9e-41c5-bb0f-10fc76cfc201",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_timeline_destroy",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "9cc5d1c6-cfb0-4239-865d-3df342aa61ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_timeline_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "881f9bc6-4ed4-4359-b59d-b86565524da7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_timeline_get_times",
                    "help": "(variable,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "b4c26771-6030-43ce-b738-59e090d5abbf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_cache",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_cache",
                    "returnType": 1
                },
                {
                    "id": "e8274b36-efc5-4051-ba41-21a5951f6792",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_create",
                    "help": "(name,[target])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_create",
                    "returnType": 1
                },
                {
                    "id": "7ab381df-e5db-4ada-aa20-6ab5c2d8fa54",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_destroy",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_destroy",
                    "returnType": 1
                },
                {
                    "id": "02f706db-be4b-49ec-a1c8-7a4722b36e63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_exists",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_exists",
                    "returnType": 1
                },
                {
                    "id": "0b24a33e-2ce6-40e5-b2c3-e7e5ee0a22cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_get_children",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_get_children",
                    "returnType": 1
                },
                {
                    "id": "f78b04ed-17ae-4bd2-848e-edb9b07c78ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_get_name",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_get_name",
                    "returnType": 1
                },
                {
                    "id": "a09c0893-d08c-4db8-b6fb-41d14a49e932",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_setup",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_setup",
                    "returnType": 1
                },
                {
                    "id": "22313c33-0cd9-46b3-8e16-e54e5db91208",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_children",
                    "help": "(constraint,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_children",
                    "returnType": 1
                },
                {
                    "id": "855ba6f8-a632-41f5-bc4f-91e3654092b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_name",
                    "help": "(constraint,name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_name",
                    "returnType": 1
                },
                {
                    "id": "40e0bf10-5eb7-4c90-a8fe-c5af6e68ded1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_offsets",
                    "help": "(constraint,x,y,xscale,yscale,yshear,rotation)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_offsets",
                    "returnType": 1
                },
                {
                    "id": "b8c0e73a-2e66-4db7-b62a-8367503ccb71",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_pose",
                    "help": "(constraint,translateMix,scaleMix,shearMix,rotateMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_pose",
                    "returnType": 1
                },
                {
                    "id": "1456b4f0-a455-4eb7-b49a-7c9d013c961a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_pose_applied",
                    "help": "(constraint,translateMix,scaleMix,shearMix,rotateMix)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_pose_applied",
                    "returnType": 1
                },
                {
                    "id": "7623eef1-9e6f-4b9d-8102-92c6810ab5cc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_state",
                    "help": "(constraint,local,relative)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_state",
                    "returnType": 1
                },
                {
                    "id": "f3799dbb-47fc-40b9-993e-2cd03242201a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_set_target",
                    "help": "(constraint,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_set_target",
                    "returnType": 1
                },
                {
                    "id": "e600250d-dfde-4d46-95a2-142d164bef2e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_constraint_update",
                    "help": "(constraint)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_constraint_update",
                    "returnType": 1
                },
                {
                    "id": "cb87f456-5cbc-4184-98c6-c598ca51271a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "947c9db8-c76f-41c7-8580-527229606f00",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_create",
                    "help": "([constraint])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "bd18e2db-c7fc-49c7-9120-decd0842c861",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "3251fc38-ace3-44fd-b9bd-1a813af0cc18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "b9852667-3e3c-4665-a678-ac35153efc87",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "a3129db3-230d-40d9-8e06-ddfadb34c485",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "a02b5bba-f0b4-443a-9197-8dc41462dd1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_set_constraint",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_set_constraint",
                    "returnType": 1
                },
                {
                    "id": "312675c2-8e05-41e0-baa5-a5309b3e90f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_transformation_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_transformation_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "31b0a251-918d-4d3a-aa83-96cc10ff5ffc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_apply",
                    "help": "(timeline,keyframe_previous,keyframeA,keyframeB,amount,mixPose,alpha,events)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_apply",
                    "returnType": 1
                },
                {
                    "id": "eccc73b4-1ff3-4cb6-ac21-8b2605b11418",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_create",
                    "help": "([bone])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_create",
                    "returnType": 1
                },
                {
                    "id": "a08ca886-32c5-486e-9b7d-7e5d12659ea3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_destroy",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_destroy",
                    "returnType": 1
                },
                {
                    "id": "a8e4248b-2829-40cf-9b6b-dc22c2244ded",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_exists",
                    "help": "(timeline)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_exists",
                    "returnType": 1
                },
                {
                    "id": "a460c6fb-fe94-4b49-938d-89020e4d5dd3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_get_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_get_keyframes",
                    "returnType": 1
                },
                {
                    "id": "d1c6509a-dcce-4b4b-8952-6d069896fc9b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_get_times",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_get_times",
                    "returnType": 1
                },
                {
                    "id": "5014a4ea-b581-492d-86ae-f22c713c5eb8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_set_bone",
                    "help": "(timeline,bone)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_set_bone",
                    "returnType": 1
                },
                {
                    "id": "4d7a4ea5-7bc0-402e-a5d7-6a35cb38695d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_translate_timeline_set_keyframes",
                    "help": "(timeline,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_translate_timeline_set_keyframes",
                    "returnType": 1
                },
                {
                    "id": "b46695a8-85ba-45d1-aff8-80fdbc2f8317",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_type_script_get_index",
                    "help": "(type,function,[private])",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_type_script_get_index",
                    "returnType": 1
                },
                {
                    "id": "c538613e-65fc-4460-a5c0-b34e7c55aed2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_updatable_cache",
                    "help": "(variable,id)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_updatable_cache",
                    "returnType": 1
                },
                {
                    "id": "e8b116a8-167b-4c1a-b17d-049b61da7bdc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_updatable_destroy",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_updatable_destroy",
                    "returnType": 1
                },
                {
                    "id": "6a111ac6-dd6d-4f60-a690-77f076d57b63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_updatable_exists",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_updatable_exists",
                    "returnType": 1
                },
                {
                    "id": "f5a8faa8-4c07-4db6-b345-309bc45d387c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_updatable_setup",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_updatable_setup",
                    "returnType": 1
                },
                {
                    "id": "b838d079-2628-401c-a929-1c43c0d615a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sk_updatable_update",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "sk_updatable_update",
                    "returnType": 1
                },
                {
                    "id": "c7cad504-cc3d-4335-8650-820e2b280818",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "vertex_begin_sk",
                    "help": "(vbuff)",
                    "hidden": false,
                    "kind": 2,
                    "name": "vertex_begin_sk",
                    "returnType": 1
                },
                {
                    "id": "bce780e0-df4d-4262-93d6-e109e9ff5659",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "vertex_end_sk",
                    "help": "(vbuff)",
                    "hidden": false,
                    "kind": 2,
                    "name": "vertex_end_sk",
                    "returnType": 1
                },
                {
                    "id": "4abbce89-1a76-4482-8a6c-2b3a3d986b12",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_animationState_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_animationState_dispose",
                    "returnType": 1
                },
                {
                    "id": "4037b5a1-81cc-4110-9ea8-fb131a73160d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_animationState_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_animationState_init",
                    "returnType": 1
                },
                {
                    "id": "945431be-1a15-4581-949c-c95cd6fbcb10",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_animation_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_animation_dispose",
                    "returnType": 1
                },
                {
                    "id": "fc1ace76-c420-4c8f-bee9-1b43b02fdffe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_animation_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_animation_init",
                    "returnType": 1
                },
                {
                    "id": "3f2b74aa-60a3-45d6-9afd-a45153782a89",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_armature_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_armature_dispose",
                    "returnType": 1
                },
                {
                    "id": "a363ac97-900b-40ea-8ed0-589e4c89f0ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_armature_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_armature_init",
                    "returnType": 1
                },
                {
                    "id": "f7c9e393-dc3f-4a32-95be-c996b086bd03",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_assert_skeletonObjectDoesNotExistException",
                    "help": "(assertion)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_assert_skeletonObjectDoesNotExistException",
                    "returnType": 1
                },
                {
                    "id": "e10de89d-d5dd-4ab3-9acf-bdf0367fc068",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_atlas_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_atlas_dispose",
                    "returnType": 1
                },
                {
                    "id": "a03157ef-0301-4c70-b43e-f6ef9d27339f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_atlas_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_atlas_init",
                    "returnType": 1
                },
                {
                    "id": "383115df-730f-4981-80f0-8be0e4c7e032",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_attachment_interface_implement",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_attachment_interface_implement",
                    "returnType": 1
                },
                {
                    "id": "301f9477-b4b9-4ec9-9d36-4b8676182cd7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_attachment_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_attachment_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "69479731-fc79-4ada-9574-2e233d914fd5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_attachment_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_attachment_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "b11536dc-8d07-436e-a2ac-d5cb112f4323",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_bone_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_bone_init",
                    "returnType": 1
                },
                {
                    "id": "e9d0ef69-9679-4eca-8135-1bcca0d548ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_colour_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_colour_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "198651c7-b6eb-470b-af98-0f0dd0a76191",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_colour_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_colour_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "2571d56a-c7a5-4678-b616-31a620ba5b61",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_drawOrder_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_drawOrder_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "72eceae8-5b11-4b48-851e-a173cbd7cffc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_drawOrder_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_drawOrder_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "73d2db81-aa7c-40f8-913f-498b9fa2e2ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_empty_script",
                    "help": "(object,[args...])",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_empty_script",
                    "returnType": 1
                },
                {
                    "id": "ee88c90c-49f3-4322-a1e2-286c970fae07",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_event_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_event_init",
                    "returnType": 1
                },
                {
                    "id": "a90490ee-f569-4974-8df9-912e98c6d287",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_event_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_event_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "10366339-2df8-4b50-8680-b28949bf6c2f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_event_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_event_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "0e3163b6-66df-458f-937a-7f36c1717176",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_file_read_all",
                    "help": "(filepath)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_file_read_all",
                    "returnType": 1
                },
                {
                    "id": "9230f5f8-4c60-44af-a5f4-2ca311390b40",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_hex_to_alpha",
                    "help": "(hex,inverse)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_hex_to_alpha",
                    "returnType": 1
                },
                {
                    "id": "31644d9c-0a32-4b9e-9401-5b9eb86abcf8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_hex_to_colour",
                    "help": "(hex,inverse)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_hex_to_colour",
                    "returnType": 1
                },
                {
                    "id": "ee4027c9-6af6-410b-a36a-828f24aa8c29",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_hex_to_real",
                    "help": "(hex)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_hex_to_real",
                    "returnType": 1
                },
                {
                    "id": "a04499b1-2128-4472-aab7-78dbafffd79a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_ik_constraint_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_ik_constraint_init",
                    "returnType": 1
                },
                {
                    "id": "531e1c96-975d-4427-90b9-d054ba774c2c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_ik_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_ik_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "88d3804c-afa7-46b8-ba1d-345f8d572b80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_ik_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_ik_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "f6e345f4-711b-466c-8c72-a3f67a3e6635",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_parent_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_parent_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "4846e2a6-5af9-4586-9439-793e027f879d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_parent_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_parent_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "b933204b-0098-4a6d-b010-5af74c416f73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_physics_constraint_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_physics_constraint_init",
                    "returnType": 1
                },
                {
                    "id": "4df63bc0-9748-4252-b020-8f098d83ed0a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_plane_attachment_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_plane_attachment_init",
                    "returnType": 1
                },
                {
                    "id": "bc4010e4-1aa3-4d6e-990f-194554e697bd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_point_attachment_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_point_attachment_init",
                    "returnType": 1
                },
                {
                    "id": "17f0c616-5fa5-42e5-a521-98625f07e75a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_renderable_interface_implement",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_renderable_interface_implement",
                    "returnType": 1
                },
                {
                    "id": "3295c418-f318-4162-9a70-ab59f5001891",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_rotate_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_rotate_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "de4fb665-9f58-4b45-9908-d354bc2690ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_rotate_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_rotate_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "264cb33f-e8fd-49f3-9124-4bd56119b2d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_scale_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_scale_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "52b81dd1-0347-42e2-99b7-63568609f13c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_scale_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_scale_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "082f1f30-13d4-4d4f-bda5-aeae0af4c1b4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_search_binary",
                    "help": "(id,value,step,min,max)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_search_binary",
                    "returnType": 1
                },
                {
                    "id": "8cd66609-7a37-4798-be66-7e7c7e489a22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_search_linear",
                    "help": "(id,value,step,min,max)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_search_linear",
                    "returnType": 1
                },
                {
                    "id": "8cd50bb8-4c46-4697-ad2f-d03389a8bf35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_shear_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_shear_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "67a09197-fa6a-4ec3-ad49-d5f1fe9f53f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_shear_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_shear_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "f46deef5-8ba2-4b1e-8fc5-7e48b0b893c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_shift_value",
                    "help": "(id,pos,x)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_shift_value",
                    "returnType": 1
                },
                {
                    "id": "351b79cc-6a6e-4f37-964d-82a9280b6348",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_shift_value_list",
                    "help": "(id,tuple)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_shift_value_list",
                    "returnType": 1
                },
                {
                    "id": "ae937936-4bd8-4e38-92dc-9d0a8bfbc8e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_skin_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_skin_dispose",
                    "returnType": 1
                },
                {
                    "id": "482cd9f8-2630-41aa-ae17-a2cfaf6831c3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_skin_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_skin_init",
                    "returnType": 1
                },
                {
                    "id": "f5abf87b-2930-40e7-b9dd-bfec313659a2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_slot_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_slot_dispose",
                    "returnType": 1
                },
                {
                    "id": "981bd695-0d4d-4ff4-8a38-50a10ca4e9b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_slot_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_slot_init",
                    "returnType": 1
                },
                {
                    "id": "53b2bd15-888d-40c5-997b-816579f2cfbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_timeline_interface_implement",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_timeline_interface_implement",
                    "returnType": 1
                },
                {
                    "id": "dfbd93aa-e9ca-4010-8018-628a6d1c991e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_transformation_constraint_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_transformation_constraint_init",
                    "returnType": 1
                },
                {
                    "id": "02409e8f-fa41-4ee8-afc0-311506eb552e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_transformation_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_transformation_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "30270de4-b5dc-48af-a02f-ebfd08e255b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_transformation_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_transformation_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "5c097a67-d1bd-4484-86c4-13ce7ede016a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_translate_timeline_dispose",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_translate_timeline_dispose",
                    "returnType": 1
                },
                {
                    "id": "27799600-1472-4147-b960-6611875ba8ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_translate_timeline_init",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_translate_timeline_init",
                    "returnType": 1
                },
                {
                    "id": "4834a6f6-91c8-4c5a-bf1a-5b0306bb0d3b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sk_updatable_interface_implement",
                    "help": "(variable)",
                    "hidden": false,
                    "kind": 2,
                    "name": "__sk_updatable_interface_implement",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "ffebf7e5-ca34-4ac2-b69e-e5967f72a770",
                "0c5b0b34-d22c-47c0-b351-f6bac87e03e5",
                "1e7e0e6d-4dc6-433e-a8c9-c631b3906334",
                "510e2720-4bb2-49e6-8fab-ac41d2bcc8eb",
                "d0b57373-206a-4faf-956f-21db0f1165fc",
                "283872d6-df90-4a21-b79d-568853f69737",
                "fb8387fd-dd16-4223-ae68-48d0b047e73b",
                "3b451598-7849-433f-9806-4463d3ca2541",
                "ad858f8d-abaf-4be8-9aa8-9bbd97e70fb2",
                "1cc04cba-46bd-44f6-aef1-cc478d412614",
                "52162ab7-b3c7-4b76-b2f9-8c0c6849777c",
                "3e5654ec-6140-40d2-b5a5-1e20c55ec6c6",
                "85ade206-fec2-48be-a1a7-c9c4b86ffe85",
                "243ab232-ec27-416e-8b7e-e1da7bb6b0e1",
                "5400f165-ab80-4b61-90a2-68c0a75ebf7f",
                "fdbda533-c585-4108-91f4-3d7d544e5668",
                "30f2a2ae-bc32-4024-8457-b6c18ffcc9d1",
                "60a07115-e982-4665-a62c-c9aed2a81da3",
                "cacf1b63-b53e-4bbb-9033-aab268f324fb",
                "fc834571-dbda-49de-9620-c3352b17d65e",
                "8e11d169-0f95-4b40-ba9c-1a0e88d4bafc",
                "b37f4421-d4f2-4ba5-bacf-47fe11ee0cd1",
                "a17ce507-0f7c-4a63-9134-4a0d20d2704b",
                "045761c0-504d-4f44-8b52-1270e8a013f4",
                "0352af9c-1008-4170-8b13-163359282ee8",
                "79f210bb-a469-456e-8fda-fb48f8dd74ef",
                "1f2c41fb-9359-431d-95a3-e821d9fdb0fd",
                "04e802aa-938d-47e6-bac5-585e87b91927",
                "491dc2de-e03c-4376-9681-1b3ee64d6287",
                "8f74f087-51fd-4578-9eff-e29f0a3ff153",
                "20dd086a-fbe3-475d-ab86-ce928e98a084",
                "eb2041ba-e126-4c16-9750-26705b71afab",
                "6819bb3f-fd29-4038-855b-281f51b5745f",
                "5fbeb563-6171-43e2-878b-1f91e61b5682",
                "dad86a8f-137e-46d3-8fdf-321893eb96d9",
                "d9953ba2-651d-46a4-8669-f3ecadb272bb",
                "5ccfd2b3-7473-41dd-a3bc-2f134cd5027e",
                "b19d750d-fc7f-4cda-8921-af726e30102f",
                "dab6783f-6c97-4c05-96dd-291959315164",
                "d9b8a835-ab3a-4b2a-a6c0-53103092df7f",
                "2f364305-26b7-47f1-94eb-eb407b43e51b",
                "117d817c-446a-42b4-9873-e7e3f064761b",
                "ed483838-61ff-4648-8b7f-9a52e2385325",
                "19fd6077-e47f-46de-887b-38f347939f82",
                "3a5c7204-235a-4bff-9e31-553d97e53dfd",
                "8ce4cdd4-e07d-42d3-aff6-2fda5fe85c2a",
                "928419ee-3b7c-4ad8-aac1-fc685fc1ea72",
                "1039651e-6a31-4f98-99b8-a6ab0cb84106",
                "e482ea87-89ce-4e65-8d7f-8b798101a5a9",
                "afdd3733-ff53-4429-80a4-49ca52e5d7d8",
                "09de3c4b-eb0c-4ee6-bf89-5246395fd4a5",
                "b467e924-54ff-4c23-a6a5-7ee2302f25fb",
                "903a8e08-635c-4416-b30d-eced193c9471",
                "f09e2a40-dcae-4c28-9e29-a73e95a7ea41",
                "b7ae904b-661e-4e0c-a313-c7e620cc1913",
                "c08a20ca-83f0-44be-916a-be734d8225db",
                "a9047721-8a1c-4744-8bcd-39f9646af0fc",
                "43eeb7f5-2c15-49cd-9df6-0740a7274eec",
                "6b1483fd-bf11-4542-bd30-1e23442af119",
                "e23fea2a-a0b1-4ad8-862b-9650ce9744d9",
                "5efe5b73-e057-449f-a288-da9d881db26c",
                "fab715cc-5376-4e14-a82e-abe9511204d8",
                "8357f2da-2dfe-4cbf-a9e6-1fe6c31d25e8",
                "f9f1d952-68fa-42e9-8595-3b0f3d68ec88",
                "96231bcd-05cf-4809-bd42-14c43d667a1e",
                "5a56cff0-3a46-42e0-a19e-89880e1d932b",
                "06635ebd-f02b-4cef-a6df-fdf29bd39333",
                "5f9aa7ea-33f6-454d-9805-9ca8af9194f7",
                "5eac5c75-58b7-42a2-a2e6-dad53e85484c",
                "8e8a9c65-34f1-4fb7-9610-a0c9ddfa095f",
                "a4685690-4f08-449a-83a9-5f517784a126",
                "c538f008-f609-4f46-9454-fc49641dc8f0",
                "ea2a97c2-6e06-4c4f-867b-b74e1b8348c7",
                "771297d3-48bf-4598-b7c5-1ec345f8664f",
                "57b550fc-2148-40ed-9290-085e45cb781f",
                "0fc7ab77-722f-4f23-9f93-8f3b508a0836",
                "ec5a6e17-c017-47e0-8ddf-c4e14c356c1b",
                "dc5f6434-959e-4348-94bf-9a38936468e2",
                "6f1fed77-4a94-4b5e-bdfe-a47a931b7596",
                "9bd2ccae-3793-4f82-a6b8-ca86dc0ddb41",
                "96916ef9-114e-49b4-a1cf-b0ec002e681a",
                "a5e17d95-4897-48b8-8a8a-5f7b965ce1fd",
                "cd7dd14a-3f7b-456c-8279-0c73be6974a3",
                "4e083107-e4a7-42e3-aa1a-13d1bad04f82",
                "7e067791-2191-4ef3-85c6-68a7627723d4",
                "162fe2f3-0019-48a1-b31d-2d786855b394",
                "dc8b6040-b9c9-4534-8946-27328140aa67",
                "5754a9f6-9a4c-46f6-a87e-d93e91460c4e",
                "bf982c9a-0df4-4abf-86af-9efdbba3e0c1",
                "fac1a214-d544-4cd4-b55b-6ad8a72fa1ff",
                "a3b8f763-f306-4b9b-94ab-04dc6e58e691",
                "f946c209-a7a8-44c1-8523-5f0a62c098fe",
                "1fe7ec95-bc96-4c82-8c0f-dca90cc41028",
                "f36da479-c175-4907-b0c8-eea044071f43",
                "c5c361d1-96ed-4217-a75e-7624491a8a77",
                "7140f2c7-54c4-4c38-8986-ed576cfa84a8",
                "0c356386-a312-4655-9d71-4353759e12e1",
                "55c39d20-c2f3-4f9e-b4d3-47391f4c7c18",
                "7a6802ce-97e1-487a-8203-6fb4f2b9b6b0",
                "bc9a782c-de66-4539-ad12-6f855407bd5d",
                "717c3345-8782-4787-b713-a37ca2f1d7b1",
                "4433896e-e8ae-418e-9e35-2de6dda12271",
                "86ec3c6d-7af6-412f-b8e9-6d8b322988da",
                "e52511a1-3bc2-486d-8e6a-78a5ac1773b1",
                "92dd10f4-f8a5-47da-9df0-9e10128fd4b7",
                "86556d2a-fbee-47ce-bbe6-13eb8589de9e",
                "b05de207-68fe-49b2-b08e-6708de4de637",
                "1396a5fc-f03f-4352-b9d4-541e9a27495c",
                "e31e516c-8206-4831-a2c9-2761726e3b8b",
                "01b66a13-6bc0-44cb-b00b-5680b49d6136",
                "118944cc-f7c4-4608-a2af-117f0a8b7453",
                "c3a4c257-6ed7-4c3a-83be-8dd8f826e5e6",
                "0faf57a2-40ff-48c8-80b6-cc42b4375de1",
                "2b725d90-ee4e-482d-a0e1-983130f7cf61",
                "6dd8539f-47e4-4a06-946e-f98e0640f7ed",
                "b6c4bf4f-3f12-4e38-8a3c-4b7a902ff2f9",
                "84d7c713-5e4f-4595-bd70-fc8e0549f7ae",
                "6e2be9bb-a445-4b5a-b5c1-5827a5d20992",
                "6a5d136f-210c-4459-94d4-8361a52617b7",
                "5f5d6993-236a-4177-bbab-1fcee911cfe3",
                "cb7f3793-9572-44fa-b3bf-b45d0fd542de",
                "904a4d84-6724-4868-98d7-09fd8ad6e0a9",
                "69bbccc0-1181-4f7e-8e89-d434bd89daa4",
                "76b71759-10b2-49c7-abb8-648cd80b0b87",
                "dee8da6a-3300-4038-86d5-a9b6bafa7586",
                "8937e0d4-a77b-4ecb-b69b-a3721955b0c1",
                "c85e344c-f9b6-42d0-8937-334215c1c0b7",
                "cebfbce0-c85b-448c-b95d-9e20a43709f8",
                "5173e5ee-1e0d-45a6-a1eb-83aafd806c90",
                "bdf18c5e-8eb1-400d-8546-006de4283818",
                "2c9d551d-d820-42b4-9ea6-1ea247242d7e",
                "fd1ab7c5-2403-48c8-bf7a-7ed198de17b9",
                "54e839a7-0e0f-4dd3-a609-d286a2e146ae",
                "4edd6543-eea7-476b-b9cb-8af470ba4eb6",
                "b11f620d-c1f0-4fda-a3c5-e7330a2a0848",
                "5f936068-22c4-4180-a26e-df0a29370547",
                "54162ac3-9646-4658-ab5d-51d984e3e94d",
                "6c7d4a43-d4e1-4ecc-b09a-e87ec57241bf",
                "8e3f8740-c485-4179-b961-67279f871056",
                "6da0504a-0d3c-4206-8831-8b06e476a063",
                "d57428f3-865e-41b9-896a-1241042f26a1",
                "f4bb591c-ef74-4eb5-99c6-a614f87c01eb",
                "34588b96-8746-418f-90a5-7a33f235f926",
                "7a180ec2-58f4-4dac-8d4c-3d82e4e003b2",
                "1eb87c06-0df6-406e-8cc0-48b69688f581",
                "bb9dbbec-cbe9-41be-9fe4-04a3dc38a1f0",
                "7ac8428f-8570-4db5-b423-6d7dfaffdc45",
                "d8b59f75-bb5f-47fe-98a5-059e81248977",
                "fd2e0241-2f96-4c33-8b07-4b8eaa56e088",
                "57067e36-17f0-4b9b-acf3-1d9798228869",
                "0fca413d-d6a9-4cce-aed6-ec8e90ef1c3a",
                "5821cccc-ed8f-4a83-954c-c8050742b347",
                "6caada18-2d37-46fb-b4db-339c8c6cbf15",
                "16b68616-dbc7-4eb2-a526-6b4d6c3ffe93",
                "d3706954-b366-438b-b44a-3a3d4292d030",
                "7381896c-8d18-43fb-af59-2ed59f9f66f0",
                "15202dbb-6d87-4b4b-b23d-60f9750dd880",
                "adc1fc5f-6c20-44d9-b617-1895b62ac889",
                "cef48b56-5650-49b5-bbb9-61ba1642b2e8",
                "291c2f8c-bb5d-47c6-95fd-60f606239870",
                "1efe28ae-0e6f-429b-b44b-29e18277d633",
                "438a61be-b204-4260-82a2-452068cfc101",
                "d9f0a59f-b970-40e8-a0b2-032228decaa5",
                "6641865e-11a1-44e0-9e2e-d5b73e03e82b",
                "692c9f7d-80be-4a74-bd8a-1559e4bf4e66",
                "79033ea1-e91a-42e6-9460-553c566a618a",
                "4fb04cb8-b8fa-4f71-a36d-988614a19571",
                "75ee6e82-df50-4527-8ddd-27cf9aa591d9",
                "134cdad3-77c7-42ba-a998-333e9299502b",
                "8ad025dc-d4e3-48c2-be65-e014fc70c34d",
                "f4174f6e-3daa-4c70-a2ac-f512f244a692",
                "0aa251ba-936a-4368-8ec0-da2cae456a3e",
                "8e1029ea-9883-4f88-ac18-b6c2aa4d0313",
                "fe01396f-35a9-4308-9780-fe5ca10be549",
                "23a6894d-7a5b-4197-812a-7944307951d0",
                "13114666-8675-4261-b327-569e652fbad5",
                "0a40c34c-161e-422a-9cfd-1d81af73cd65",
                "370927b5-dc69-4408-a322-edd34c203224",
                "aeffe5c2-02a8-42af-a355-bda7e1fd4827",
                "0fcb6273-e9ec-4092-81ca-1f86214ea303",
                "29073515-a641-4fb0-9600-c46d23d8751a",
                "d23b03d9-82d4-43dd-803e-2c32e7d8796e",
                "18e6ac52-4824-4d76-9372-e3b5e4ff3326",
                "a76f8550-58aa-478f-b0b4-0e3a0df1ce92",
                "6cc50309-f8a6-401a-b244-e4041ec3d9ce",
                "dbd090e6-3e37-4e39-9f16-597908c802b3",
                "15fcdd0a-e15f-4660-92ef-3ea10c184253",
                "51426c18-9826-4299-96be-de3244293788",
                "43254774-d171-4b94-bd7d-ce3d1321a6a6",
                "6b95a3de-c49e-465d-83fc-2ee8e4bf4523",
                "5dc1ea18-cfe7-431e-89c1-d9c86a3346dc",
                "1230ca83-2587-41a5-b795-1b75cfc77903",
                "139d6846-796d-448c-9d2d-83bcd81ead7e",
                "fec89b83-848a-4289-9072-0d23c11f766d",
                "d6820ca1-e7d0-4091-bf08-78661fbc3aea",
                "4bc1053e-c123-4c61-bb98-0a865b173c92",
                "8f862924-29c7-49ca-adfe-42f50d5ddb67",
                "4d33c531-972b-4933-83b8-91c24a1a3900",
                "82a36cbd-4cec-4f83-b357-7eb38d608a82",
                "5b4a4a4a-0b9d-4183-acc7-0e5ce1467c20",
                "a484b06e-8518-45f0-877b-daa44e6d80ac",
                "65a72094-bcaf-4a85-ba10-eaea0eaa3097",
                "20c454ac-e5b7-41cd-9ea4-bb1f4f25d489",
                "70b1950e-3c0b-4e03-8c26-5a56d95d85c1",
                "e132d0d7-2d9c-4834-9130-7dc8241cdaf1",
                "27b86856-7283-4ce2-9e35-1e3d06ce80b4",
                "86e6e0f5-0628-4b04-b2c3-736bb3a0952d",
                "cfd3c6ea-8cd7-4812-9b93-b8cd022338ae",
                "c6b1757a-f9aa-446a-80b7-3d61b3564969",
                "2ed21d76-e223-4afb-95c5-4570ed193198",
                "b2f58c9d-3366-43b9-9c99-91ccd760b20a",
                "d95a6ef2-2846-4f6f-b8f1-f6b93d53629c",
                "1ac58210-28b7-482f-87a1-fa5ca1d6758e",
                "f5e46aa3-99d9-48d2-a3e3-df734cc664c8",
                "7bea64b1-87d4-40a0-a469-7bf97160514a",
                "bcfad138-8e86-4470-a986-d82d7ba3a89a",
                "eb952834-20cf-4262-8033-c4d4e3d803ee",
                "8a39ee1b-4288-49d1-a645-44b3d4e82dbc",
                "e80216b7-6c5c-4606-83d3-94450f282d1c",
                "0409bd98-be57-4e43-bdb2-b7a3ad382521",
                "808dffb5-7caa-4c3d-a992-b2f184fdf0d4",
                "56e6a405-f795-4b98-8b10-8173b9703042",
                "9126c755-4b92-4a0c-85e1-ae21af74d37b",
                "e41f14c2-257d-4800-bb60-8b2e4b05e7df",
                "9877be2e-8e33-4b2e-bcb7-6f9e72d5c002",
                "51a0a131-9f48-400c-b179-0f68792fbdff",
                "050a5f71-69a7-4472-98fd-4bd7f08def25",
                "9e21f65d-846e-48fa-8fc4-4732f2531621",
                "23870b91-0e81-49b0-9c3a-008a498f5ae4",
                "d1777401-e01b-4a96-900d-6668619b8678",
                "daaeefb4-c5c6-4ab4-80c0-bbb5fee9095e",
                "c95d8a6b-6fa4-43a2-8368-e0d00427dcdc",
                "286b76c9-7a20-436d-a1af-d428c5d1dba8",
                "9b47df4f-35c4-4f92-8987-01f696f759dc",
                "f844a354-7e91-4c78-8a63-9e14d16dcb35",
                "aa687de1-4ae5-4932-88a0-ee05ab1ff4e8",
                "8634381c-9d27-4044-a584-7668cb89d821",
                "2c2fd7a6-c328-40dc-bcbc-a1fcc9164d98",
                "0419d414-ac0e-4285-b05d-0f73080568a7",
                "feb7ea17-ec5d-4344-860b-40ee733e9de7",
                "a73f2285-8f22-46d9-9a7f-7162aba90e70",
                "cf23baa6-c107-40f5-bfd6-d5b5c7dff263",
                "61feb13f-63e5-4282-ad57-8bc2943a629b",
                "5676f6d5-83a0-4560-a9dc-af0b80500bfd",
                "16e0e866-0fdc-4841-882f-9e67e6efa745",
                "968c5b61-28ad-4647-9ac7-eb37b5ede723",
                "43e05f8a-2f3b-4846-a6a7-5e13fdac0549",
                "bce827fe-96a7-4597-961d-9f22de5388cd",
                "cfa23ad5-f357-4b25-ae09-0f96a5c36ff9",
                "b1b15162-e54f-4fd4-8bcc-e0895d939884",
                "8bb915eb-420b-4e48-8ed0-aca18dd5d207",
                "0b9a0fda-6f64-42f2-8526-3f732977d8f4",
                "894d8bef-8927-423a-a3fa-8d1fbfa6d933",
                "c7f25be0-9885-43f9-8254-85a4566792d6",
                "b88c82b8-6f54-4b55-8b22-a89107ac33b5",
                "cfdb88f5-e6ca-4318-98e1-184c497f8200",
                "21c7aea2-4c3e-42a9-a96f-60c5752b8456",
                "6382044e-7113-41ac-8df9-be2e5fafc376",
                "0da3c88a-0ff7-4035-aaf2-ad0e6df5649f",
                "a0094f65-9b84-43d9-8ca6-577ec860ce27",
                "5f5a11cc-78d3-40a4-8c8c-eba10db0ab9b",
                "af2ff3ce-68e0-4e5e-9b03-d1c23fef6807",
                "085a17c8-570d-4182-875e-96354505687c",
                "b1b2efed-9c09-4177-821c-3f945cffde09",
                "41934240-d01a-4f56-a55e-a6cca8c13bd7",
                "b55d1f02-7f2b-4f0e-82ec-a3380d8eec0b",
                "53bdcccc-b6a0-424c-9aae-493c7a5cdb1d",
                "d1e3fa86-a37d-4489-a1e7-6aa88eec2ad0",
                "a17903e7-2b72-4d25-abbc-c654a4704c15",
                "2ff50572-361e-40ca-a5ec-3fa23c55ea09",
                "63415088-e3e6-45a5-bfb4-a47e11f3251e",
                "02222252-b1a1-4af2-a551-a3ced277a15d",
                "7c2969ad-2817-4235-9f79-239d89bf9d6f",
                "3714955f-107d-4df1-9804-1b6a0776f8a8",
                "6110a385-a2c9-4567-a976-a90b754c176b",
                "d5fb118c-89b9-4afd-822e-fcda97b31f52",
                "e8615203-e97a-4e27-8eea-481a5f62c195",
                "7b1aad88-8e25-4072-a724-18d88a3d6642",
                "348c2176-0f42-4dee-8800-0c9f301b0a85",
                "576f5094-3cea-4834-9db6-ac40546401bc",
                "5d6d9429-66d5-419a-8ad8-7d6a2b00e12d",
                "1918b1a9-62cc-4085-a8be-25ba2b47ee39",
                "8ed756ea-e821-419a-8ad2-4a0910ae2445",
                "45c5ea6e-58c4-4372-a78e-696b27951d56",
                "32b50a8b-e984-4db8-b76d-a1951bad046c",
                "2dafb285-f186-44ff-ac9d-847830e82b2e",
                "3a20b053-698a-4a8b-9610-a812917e07b1",
                "7fdab28f-6efe-4569-a7c5-8be12bb7541f",
                "915304ab-4b2f-4dee-8402-1a8b3bfbd022",
                "78c3b2b0-6947-452d-ace5-20f076cf71ad",
                "7ae8acef-cf9e-41c5-bb0f-10fc76cfc201",
                "9cc5d1c6-cfb0-4239-865d-3df342aa61ad",
                "881f9bc6-4ed4-4359-b59d-b86565524da7",
                "b4c26771-6030-43ce-b738-59e090d5abbf",
                "e8274b36-efc5-4051-ba41-21a5951f6792",
                "7ab381df-e5db-4ada-aa20-6ab5c2d8fa54",
                "02f706db-be4b-49ec-a1c8-7a4722b36e63",
                "0b24a33e-2ce6-40e5-b2c3-e7e5ee0a22cb",
                "f78b04ed-17ae-4bd2-848e-edb9b07c78ce",
                "a09c0893-d08c-4db8-b6fb-41d14a49e932",
                "22313c33-0cd9-46b3-8e16-e54e5db91208",
                "855ba6f8-a632-41f5-bc4f-91e3654092b0",
                "40e0bf10-5eb7-4c90-a8fe-c5af6e68ded1",
                "b8c0e73a-2e66-4db7-b62a-8367503ccb71",
                "1456b4f0-a455-4eb7-b49a-7c9d013c961a",
                "7623eef1-9e6f-4b9d-8102-92c6810ab5cc",
                "f3799dbb-47fc-40b9-993e-2cd03242201a",
                "e600250d-dfde-4d46-95a2-142d164bef2e",
                "cb87f456-5cbc-4184-98c6-c598ca51271a",
                "947c9db8-c76f-41c7-8580-527229606f00",
                "bd18e2db-c7fc-49c7-9120-decd0842c861",
                "3251fc38-ace3-44fd-b9bd-1a813af0cc18",
                "b9852667-3e3c-4665-a678-ac35153efc87",
                "a3129db3-230d-40d9-8e06-ddfadb34c485",
                "a02b5bba-f0b4-443a-9197-8dc41462dd1c",
                "312675c2-8e05-41e0-baa5-a5309b3e90f9",
                "31b0a251-918d-4d3a-aa83-96cc10ff5ffc",
                "eccc73b4-1ff3-4cb6-ac21-8b2605b11418",
                "a08ca886-32c5-486e-9b7d-7e5d12659ea3",
                "a8e4248b-2829-40cf-9b6b-dc22c2244ded",
                "a460c6fb-fe94-4b49-938d-89020e4d5dd3",
                "d1c6509a-dcce-4b4b-8952-6d069896fc9b",
                "5014a4ea-b581-492d-86ae-f22c713c5eb8",
                "4d7a4ea5-7bc0-402e-a5d7-6a35cb38695d",
                "b46695a8-85ba-45d1-aff8-80fdbc2f8317",
                "c538613e-65fc-4460-a5c0-b34e7c55aed2",
                "e8b116a8-167b-4c1a-b17d-049b61da7bdc",
                "6a111ac6-dd6d-4f60-a690-77f076d57b63",
                "f5a8faa8-4c07-4db6-b345-309bc45d387c",
                "b838d079-2628-401c-a929-1c43c0d615a0",
                "c7cad504-cc3d-4335-8650-820e2b280818",
                "bce780e0-df4d-4262-93d6-e109e9ff5659",
                "4abbce89-1a76-4482-8a6c-2b3a3d986b12",
                "4037b5a1-81cc-4110-9ea8-fb131a73160d",
                "945431be-1a15-4581-949c-c95cd6fbcb10",
                "fc1ace76-c420-4c8f-bee9-1b43b02fdffe",
                "3f2b74aa-60a3-45d6-9afd-a45153782a89",
                "a363ac97-900b-40ea-8ed0-589e4c89f0ee",
                "f7c9e393-dc3f-4a32-95be-c996b086bd03",
                "e10de89d-d5dd-4ab3-9acf-bdf0367fc068",
                "a03157ef-0301-4c70-b43e-f6ef9d27339f",
                "383115df-730f-4981-80f0-8be0e4c7e032",
                "301f9477-b4b9-4ec9-9d36-4b8676182cd7",
                "69479731-fc79-4ada-9574-2e233d914fd5",
                "b11536dc-8d07-436e-a2ac-d5cb112f4323",
                "e9d0ef69-9679-4eca-8135-1bcca0d548ab",
                "198651c7-b6eb-470b-af98-0f0dd0a76191",
                "2571d56a-c7a5-4678-b616-31a620ba5b61",
                "72eceae8-5b11-4b48-851e-a173cbd7cffc",
                "73d2db81-aa7c-40f8-913f-498b9fa2e2ca",
                "ee88c90c-49f3-4322-a1e2-286c970fae07",
                "a90490ee-f569-4974-8df9-912e98c6d287",
                "10366339-2df8-4b50-8680-b28949bf6c2f",
                "0e3163b6-66df-458f-937a-7f36c1717176",
                "9230f5f8-4c60-44af-a5f4-2ca311390b40",
                "31644d9c-0a32-4b9e-9401-5b9eb86abcf8",
                "ee4027c9-6af6-410b-a36a-828f24aa8c29",
                "a04499b1-2128-4472-aab7-78dbafffd79a",
                "531e1c96-975d-4427-90b9-d054ba774c2c",
                "88d3804c-afa7-46b8-ba1d-345f8d572b80",
                "f6e345f4-711b-466c-8c72-a3f67a3e6635",
                "4846e2a6-5af9-4586-9439-793e027f879d",
                "b933204b-0098-4a6d-b010-5af74c416f73",
                "4df63bc0-9748-4252-b020-8f098d83ed0a",
                "bc4010e4-1aa3-4d6e-990f-194554e697bd",
                "17f0c616-5fa5-42e5-a521-98625f07e75a",
                "3295c418-f318-4162-9a70-ab59f5001891",
                "de4fb665-9f58-4b45-9908-d354bc2690ad",
                "264cb33f-e8fd-49f3-9124-4bd56119b2d0",
                "52b81dd1-0347-42e2-99b7-63568609f13c",
                "082f1f30-13d4-4d4f-bda5-aeae0af4c1b4",
                "8cd66609-7a37-4798-be66-7e7c7e489a22",
                "8cd50bb8-4c46-4697-ad2f-d03389a8bf35",
                "67a09197-fa6a-4ec3-ad49-d5f1fe9f53f0",
                "f46deef5-8ba2-4b1e-8fc5-7e48b0b893c8",
                "351b79cc-6a6e-4f37-964d-82a9280b6348",
                "ae937936-4bd8-4e38-92dc-9d0a8bfbc8e6",
                "482cd9f8-2630-41aa-ae17-a2cfaf6831c3",
                "f5abf87b-2930-40e7-b9dd-bfec313659a2",
                "981bd695-0d4d-4ff4-8a38-50a10ca4e9b3",
                "53b2bd15-888d-40c5-997b-816579f2cfbd",
                "dfbd93aa-e9ca-4010-8018-628a6d1c991e",
                "02409e8f-fa41-4ee8-afc0-311506eb552e",
                "30270de4-b5dc-48af-a02f-ebfd08e255b6",
                "5c097a67-d1bd-4484-86c4-13ce7ede016a",
                "27799600-1472-4147-b960-6611875ba8ec",
                "4834a6f6-91c8-4c5a-bf1a-5b0306bb0d3b"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "0.0.1"
}