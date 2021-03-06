defmodule LleCymraeg.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias LleCymraeg.Repo
  alias LleCymraeg.Accounts.Account

  def for_token(account = %Account{}), do: {:ok, "Account:#{account.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("Account:" <> id), do: {:ok, Repo.get(Account, id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
