#!/bin/bash

echo "🔧 Testing Your Specific Webhook"
echo "================================="

WEBHOOK_URL="https://deep-shadow-ai-workflow-production.up.railway.app/webhook/mychatapp"

echo "Testing: $WEBHOOK_URL"
echo ""

# Test 1: Basic connectivity
echo "🔍 Test 1: Checking if endpoint exists"
response=$(curl -s -o /dev/null -w "%{http_code}" "$WEBHOOK_URL" --max-time 10)
echo "GET Response: $response"

if [ "$response" = "405" ]; then
    echo "✅ Webhook endpoint exists (405 = Method Not Allowed for GET is normal)"
elif [ "$response" = "404" ]; then
    echo "❌ Webhook not found - Check if workflow is activated"
    exit 1
elif [ "$response" = "000" ]; then
    echo "❌ Connection timeout - Railway app might be sleeping"
else
    echo "⚠️ Unexpected response: $response"
fi

echo ""

# Test 2: POST with message
echo "🔍 Test 2: Sending test message via POST"
response=$(curl -s -X POST "$WEBHOOK_URL" \
    -H "Content-Type: application/json" \
    -d '{"message": "Hello from webhook test!"}' \
    -w "\nHTTP_STATUS:%{http_code}" \
    --max-time 30)

http_code=$(echo "$response" | grep "HTTP_STATUS:" | cut -d: -f2)
response_body=$(echo "$response" | grep -v "HTTP_STATUS:")

echo "POST Response Code: $http_code"

if [ "$http_code" = "200" ]; then
    echo "✅ SUCCESS! Webhook is working"
    echo "AI Response: $response_body"
elif [ "$http_code" = "500" ]; then
    echo "❌ Server error - Check n8n workflow logs"
elif [ "$http_code" = "404" ]; then
    echo "❌ Webhook path not found"
    echo "   Make sure your n8n workflow is activated"
elif [ "$http_code" = "000" ]; then
    echo "❌ Connection failed"
    echo "   Railway app might be sleeping or down"
else
    echo "⚠️ Unexpected response: $http_code"
    echo "Response: $response_body"
fi

echo ""
echo "🎯 NEXT STEPS:"
if [ "$http_code" != "200" ]; then
    echo "1. Go to your Railway n8n dashboard"
    echo "2. Make sure your workflow is ACTIVATED"
    echo "3. Check that webhook path is 'mychatapp'"
    echo "4. Click 'Save' on your workflow"
    echo "5. Test again"
else
    echo "Webhook is working! The issue might be in your React app."
fi