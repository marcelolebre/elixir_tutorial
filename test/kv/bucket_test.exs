defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "scores values by key",  %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deleting keys", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "cheese") == nil

    KV.Bucket.put(bucket, "cheese", 1)
    assert KV.Bucket.get(bucket, "cheese") != nil

    assert KV.Bucket.delete(bucket, "cheese") == 1

    assert KV.Bucket.get(bucket, "cheese") == nil
  end
end
