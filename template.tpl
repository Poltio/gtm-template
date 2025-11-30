___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Poltio",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Poltio"
  },
  "description": "Official Poltio GTM Template.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "poltioId",
    "displayName": "Poltio ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter your Poltio Account ID found in the Poltio Panel."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const copyFromWindow = require('copyFromWindow');
const getUrl = require('getUrl');
const encodeUriComponent = require('encodeUriComponent');
const makeTableMap = require('makeTableMap');

const poltioId = data.poltioId;
const currentUrl = getUrl('href');

// Initialize poltio object if not present
if (!copyFromWindow('poltio')) {
  setInWindow('poltio', makeTableMap({
    queue: [],
    push: function(s, r, u) {
      // Basic queue push implementation
      // We need to retrieve the queue again to push to it
      const poltioObj = copyFromWindow('poltio');
      if (poltioObj && poltioObj.queue) {
        poltioObj.queue.push([s, r, u]);
      }
    }
  }));
}

const scriptUrl = 'https://sdk.poltio.com/poltio.js?p=' + poltioId + '&r=' + encodeUriComponent(currentUrl);

injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'poltiosdk');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://sdk.poltio.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "poltio"
              },
              {
                "type": 1,
                "string": "poltio.queue"
              },
              {
                "type": 1,
                "string": "poltio.push"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyParts",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "href"
              }
            ]
          }
        },
        {
          "key": "queries",
          "value": {
            "type": 2,
            "listItem": []
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 2025-11-30 13:05:00
